import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:buffer/buffer.dart';
import 'package:dartros_msgutils/msg_utils.dart';
import 'package:dartx/dartx.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'error_utils.dart';
part 'tcpros_utils.freezed.dart';

const callerIdPrefix = 'callerid=';
const md5Prefix = 'md5sum=';
const topicPrefix = 'topic=';
const servicePrefix = 'service=';
const typePrefix = 'type=';
const errorPrefix = 'error=';
const messageDefinitionPrefix = 'message_definition=';
const latchingField = 'latching=1';
const persistentField = 'persistent=1';
const tcpNoDelayField = 'tcp_nodelay=1';

void serializeStringFields(ByteDataWriter writer, List<String> fields) {
  final totalLength =
      IterableNumSumExtension(fields.map((f) => f.lenInBytes + 4)).sum();
  writer.writeUint32(totalLength, Endian.little);
  fields.forEach(writer.writeString);
}

List<String> deserializeStringFields(ByteDataReader reader) {
  // final totalLength = reader.readUint32(Endian.little);
  final totalLength = reader.remainingLength;
  // print('Total length of string fields $totalLength');
  final stringList = <String>[];
  var length = 0;
  while (length < totalLength) {
    final string = reader.readString();
    length += string.lenInBytes + 4;
    // print('Read string $string, length $length');
    stringList.add(string);
  }
  return stringList;
}

void createSubHeader(ByteDataWriter writer, String callerId, String md5sum,
        String topic, String type, String messageDefinition, bool tcpNoDelay) =>
    serializeStringFields(writer, [
      callerIdPrefix + callerId,
      md5Prefix + md5sum,
      topicPrefix + topic,
      typePrefix + type,
      messageDefinitionPrefix + messageDefinition,
      if (tcpNoDelay) tcpNoDelayField
    ]);

void createPubHeader(ByteDataWriter writer, String callerId, String md5sum,
    String type, bool latching, String messageDefinition) {
  final fields = [
    messageDefinitionPrefix + messageDefinition,
    callerIdPrefix + callerId,
    if (latching) latchingField,
    md5Prefix + md5sum,
    typePrefix + type,
  ];
  serializeStringFields(writer, fields);
  // print(fields);
  // print(writer.toBytes());
}

void createServiceClientHeader(ByteDataWriter writer, String callerId,
        String service, String md5sum, String type, bool persistent) =>
    serializeStringFields(writer, [
      callerIdPrefix + callerId,
      servicePrefix + service,
      md5Prefix + md5sum,
      if (persistent) persistentField
    ]);

void createServiceServerHeader(
        ByteDataWriter writer, String callerId, String md5sum, String type) =>
    serializeStringFields(writer, [
      callerIdPrefix + callerId,
      md5Prefix + md5sum,
      typePrefix + type,
    ]);

TCPRosHeader parseTcpRosHeader(TCPRosChunk header) {
  final reader = ByteDataReader(endian: Endian.little);
  reader.add(header.buffer);
  final Map<String?, String?> info = <String, String?>{};
  final regex = RegExp(r'(\w+)=([\s\S]*)');
  final fields = deserializeStringFields(reader);
  // print(fields);
  for (final field in fields) {
    final hasMatch = regex.hasMatch(field);
    if (!hasMatch) {
      print('Error: Invalid connection header while parsing field $field');
      throw HeaderParseException(
          info, 'Error: Invalid connection header while parsing field $field');
    }
    final match = regex.allMatches(field).toList()[0];
    // TODO: Assert group not empty
    info[match.group(1)] = match.group(2);
  }
  // print(info);
  return TCPRosHeader.fromMap(info as Map<String, String?>);
}

bool validateSubHeader(ByteDataWriter writer, TCPRosHeader header, String topic,
    String type, String md5sum) {
  if (header.topic.isNullOrEmpty) {
    writer.writeString('Connection header missing expected field [topic]');
    return false;
  }
  if (header.type.isNullOrEmpty) {
    writer.writeString('Connection header missing expected field [type]');
    return false;
  }
  if (header.md5sum.isNullOrEmpty) {
    writer.writeString('Connection header missing expected field [md5sum]');
    return false;
  }
  if (header.topic != topic) {
    writer
        .writeString('Got incorrect topic [${header.topic}] expected [$topic]');
    return false;
  }
  if (header.type != type && header.type != '*') {
    writer.writeString('Got incorrect type [${header.type}] expected [$type]');
    return false;
  }
  if (header.md5sum != md5sum && header.md5sum != '*') {
    writer.writeString(
        'Got incorrect md5sum [${header.md5sum}] expected [$md5sum]');
    return false;
  }
  return true;
}

bool validateServiceClientHeader(
    ByteDataWriter writer, TCPRosHeader header, String service, String md5sum) {
  // log.dartros.error('Header:, ${header.md5sum} ${header.service}');
  if (header.service.isNullOrEmpty) {
    writer.writeString('Connection header missing expected field [service]');
    return false;
  }
  if (header.md5sum.isNullOrEmpty) {
    writer.writeString('Connection header missing expected field [md5sum]');
    return false;
  }
  if (header.service != service) {
    writer.writeString(
        'Got incorrect service [${header.service}] expected [$service]');
    return false;
  }
  if (header.md5sum != md5sum && header.md5sum != '*') {
    writer.writeString(
        'Got incorrect md5sum [${header.md5sum}] expected [$md5sum]');
    return false;
  }
  return true;
}

bool validatePubHeader(
    ByteDataWriter writer, TCPRosHeader header, String type, String md5sum) {
  if (header.type.isNullOrEmpty) {
    writer.writeString('Connection header missing expected field [type]');
    return false;
  }
  if (header.md5sum.isNullOrEmpty) {
    writer.writeString('Connection header missing expected field [md5sum]');
    return false;
  }

  if (header.type != type && header.type != '*') {
    writer.writeString('Got incorrect type [${header.type}] expected [$type]');
    return false;
  }
  if (header.md5sum != md5sum && header.md5sum != '*') {
    writer.writeString(
        'Got incorrect md5sum [${header.md5sum}] expected [$md5sum]');
    return false;
  }
  return true;
}

Uint8List serializeString(String message) {
  final writer = ByteDataWriter();
  writer.writeString(message);
  return writer.toBytes();
}

Uint8List serializeMessage(ByteDataWriter writer, RosMessage message,
    {bool prependMessageLength = true}) {
  final msgSize = message.getMessageSize();
  if (prependMessageLength) {
    writer.writeUint32(msgSize);
  }
  message.serialize(writer);
  return writer.toBytes();
}

Uint8List serializeServiceResponse(
    ByteDataWriter writer, RosMessage message, bool success,
    {bool prependResponseInfo = true}) {
  final msgSize = message.getMessageSize();
  if (prependResponseInfo) {
    if (success) {
      writer.writeUint8(1);
      writer.writeUint32(msgSize);
      message.serialize(writer);
    } else {
      writer.writeUint8(0);
      writer.writeString('Unable to handle service call');
    }
  }
  return writer.toBytes();
}

T deserializeMessage<T extends RosMessage>(
        ByteDataReader reader, T messageClass) =>
    messageClass.deserialize(reader);

void createTcpRosError(ByteDataWriter writer, String str) {
  writer.writeString(str);
}

class TCPRosHeader<T> {
  const TCPRosHeader(
      this.topic,
      this.type,
      this.md5sum,
      this.service,
      this.callerId,
      this.messageDefinition,
      this.error,
      this.persistent,
      this.tcpNoDelay,
      this.latching);

  factory TCPRosHeader.fromMap(Map<String, String?> info) => TCPRosHeader(
      info['topic'],
      info['type'],
      info['md5sum'],
      info['service'],
      info['callerid'],
      info['message_definition'],
      info['error'],
      (info['persistent'] ?? '0') != '0',
      (info['tcp_nodelay'] ?? '0') != '0',
      (info['latching'] ?? '0') != '0');
  final String? topic;
  final String? type;
  final String? md5sum;
  final String? service;
  final String? callerId;
  final String? messageDefinition;
  final String? error;
  final bool persistent;
  final bool tcpNoDelay;
  final bool latching;
}

class TCPRosChunkTransformer {
  TCPRosChunkTransformer() {
    _transformer = StreamTransformer.fromHandlers(handleData: _handleData);
  }
  bool _inBody = false;
  int _bytesConsumed = 0;
  int _messageLen = -1;
  List<int> _buffer = [];
  bool deserializeServiceResponse = false;
  bool? _serviceRespSuccess;

  late StreamTransformer<Uint8List, TCPRosChunk> _transformer;
  StreamTransformer<Uint8List, TCPRosChunk> get transformer => _transformer;

  void _handleData(Uint8List data, sink) {
    // print(data);
    var pos = 0;
    final chunkLen = data.length;
    while (pos < chunkLen) {
      if (_inBody) {
        final messageRemaining = _messageLen - _bytesConsumed;
        if (chunkLen >= messageRemaining + pos) {
          final restMessage = data.sublist(pos, pos + messageRemaining);
          _buffer.addAll(restMessage);
          _emitMessage(sink);

          // Next message
          pos += messageRemaining;
        } else {
          _buffer.addAll(data.sublist(pos));
          _bytesConsumed += chunkLen - pos;
          pos = chunkLen;
        }
      } else {
        // If deserializing service response first byte is success
        if (deserializeServiceResponse && _serviceRespSuccess == null) {
          _serviceRespSuccess = data[0] != 0;
          pos++;
        }
        final bufLen = _buffer.length;
        // first 4 bytes of the message are a uint32 length field
        if (chunkLen - pos >= 4 - bufLen) {
          _buffer.addAll(data.sublist(pos, pos + 4 - bufLen));
          _messageLen = (ByteDataReader(endian: Endian.little, copy: true)
                ..add(_buffer))
              .readUint32();
          // print(_messageLen);
          pos += 4 - bufLen;
          _buffer = [];
          if (_messageLen == 0 && pos == chunkLen) {
            _emitMessage(sink);
          } else {
            _inBody = true;
          }
        } else {
          _buffer.addAll(data.sublist(pos));
          pos = chunkLen;
        }
      }
    }
  }

  void _emitMessage(sink) {
    // print('Emitting message');
    // print('Buffer: $_buffer');
    sink.add(TCPRosChunk(_buffer,
        serviceResponse: deserializeServiceResponse,
        serviceResponseSuccess: _serviceRespSuccess));
    // Reset buffer
    _buffer = [];
    _bytesConsumed = 0;
    _inBody = false;
    _serviceRespSuccess = null;
  }
}

@freezed
abstract class TCPRosChunk with _$TCPRosChunk {
  factory TCPRosChunk(List<int> buffer,
      {@Default(false) bool? serviceResponse,
      bool? serviceResponseSuccess}) = _TcpRosChunk;
}

class TcpConnection {
  TcpConnection(this.socket)
      : name = '${socket.remoteAddress.address}:${socket.remotePort}';
  final Socket socket;
  final String name;
}

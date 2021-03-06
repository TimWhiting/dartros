// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'ros_xmlrpc_client.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$TopicInfoTearOff {
  const _$TopicInfoTearOff();

  _TopicInfo call(String name, String type) {
    return _TopicInfo(
      name,
      type,
    );
  }
}

/// @nodoc
const $TopicInfo = _$TopicInfoTearOff();

/// @nodoc
mixin _$TopicInfo {
  String get name;
  String get type;

  @JsonKey(ignore: true)
  $TopicInfoCopyWith<TopicInfo> get copyWith;
}

/// @nodoc
abstract class $TopicInfoCopyWith<$Res> {
  factory $TopicInfoCopyWith(TopicInfo value, $Res Function(TopicInfo) then) =
      _$TopicInfoCopyWithImpl<$Res>;
  $Res call({String name, String type});
}

/// @nodoc
class _$TopicInfoCopyWithImpl<$Res> implements $TopicInfoCopyWith<$Res> {
  _$TopicInfoCopyWithImpl(this._value, this._then);

  final TopicInfo _value;
  // ignore: unused_field
  final $Res Function(TopicInfo) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? type = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed ? _value.name : name as String,
      type: type == freezed ? _value.type : type as String,
    ));
  }
}

/// @nodoc
abstract class _$TopicInfoCopyWith<$Res> implements $TopicInfoCopyWith<$Res> {
  factory _$TopicInfoCopyWith(
          _TopicInfo value, $Res Function(_TopicInfo) then) =
      __$TopicInfoCopyWithImpl<$Res>;
  @override
  $Res call({String name, String type});
}

/// @nodoc
class __$TopicInfoCopyWithImpl<$Res> extends _$TopicInfoCopyWithImpl<$Res>
    implements _$TopicInfoCopyWith<$Res> {
  __$TopicInfoCopyWithImpl(_TopicInfo _value, $Res Function(_TopicInfo) _then)
      : super(_value, (v) => _then(v as _TopicInfo));

  @override
  _TopicInfo get _value => super._value as _TopicInfo;

  @override
  $Res call({
    Object? name = freezed,
    Object? type = freezed,
  }) {
    return _then(_TopicInfo(
      name == freezed ? _value.name : name as String,
      type == freezed ? _value.type : type as String,
    ));
  }
}

/// @nodoc
class _$_TopicInfo implements _TopicInfo {
  _$_TopicInfo(this.name, this.type);

  @override
  final String name;
  @override
  final String type;

  @override
  String toString() {
    return 'TopicInfo(name: $name, type: $type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _TopicInfo &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(type);

  @JsonKey(ignore: true)
  @override
  _$TopicInfoCopyWith<_TopicInfo> get copyWith =>
      __$TopicInfoCopyWithImpl<_TopicInfo>(this, _$identity);
}

abstract class _TopicInfo implements TopicInfo {
  factory _TopicInfo(String name, String type) = _$_TopicInfo;

  @override
  String get name;
  @override
  String get type;
  @override
  @JsonKey(ignore: true)
  _$TopicInfoCopyWith<_TopicInfo> get copyWith;
}

/// @nodoc
class _$ProtocolParamsTearOff {
  const _$ProtocolParamsTearOff();

  _ProtocolParams call(
      String protocol, String address, int port, int connectionId) {
    return _ProtocolParams(
      protocol,
      address,
      port,
      connectionId,
    );
  }
}

/// @nodoc
const $ProtocolParams = _$ProtocolParamsTearOff();

/// @nodoc
mixin _$ProtocolParams {
  String get protocol;
  String get address;
  int get port;
  int get connectionId;

  @JsonKey(ignore: true)
  $ProtocolParamsCopyWith<ProtocolParams> get copyWith;
}

/// @nodoc
abstract class $ProtocolParamsCopyWith<$Res> {
  factory $ProtocolParamsCopyWith(
          ProtocolParams value, $Res Function(ProtocolParams) then) =
      _$ProtocolParamsCopyWithImpl<$Res>;
  $Res call({String protocol, String address, int port, int connectionId});
}

/// @nodoc
class _$ProtocolParamsCopyWithImpl<$Res>
    implements $ProtocolParamsCopyWith<$Res> {
  _$ProtocolParamsCopyWithImpl(this._value, this._then);

  final ProtocolParams _value;
  // ignore: unused_field
  final $Res Function(ProtocolParams) _then;

  @override
  $Res call({
    Object? protocol = freezed,
    Object? address = freezed,
    Object? port = freezed,
    Object? connectionId = freezed,
  }) {
    return _then(_value.copyWith(
      protocol: protocol == freezed ? _value.protocol : protocol as String,
      address: address == freezed ? _value.address : address as String,
      port: port == freezed ? _value.port : port as int,
      connectionId:
          connectionId == freezed ? _value.connectionId : connectionId as int,
    ));
  }
}

/// @nodoc
abstract class _$ProtocolParamsCopyWith<$Res>
    implements $ProtocolParamsCopyWith<$Res> {
  factory _$ProtocolParamsCopyWith(
          _ProtocolParams value, $Res Function(_ProtocolParams) then) =
      __$ProtocolParamsCopyWithImpl<$Res>;
  @override
  $Res call({String protocol, String address, int port, int connectionId});
}

/// @nodoc
class __$ProtocolParamsCopyWithImpl<$Res>
    extends _$ProtocolParamsCopyWithImpl<$Res>
    implements _$ProtocolParamsCopyWith<$Res> {
  __$ProtocolParamsCopyWithImpl(
      _ProtocolParams _value, $Res Function(_ProtocolParams) _then)
      : super(_value, (v) => _then(v as _ProtocolParams));

  @override
  _ProtocolParams get _value => super._value as _ProtocolParams;

  @override
  $Res call({
    Object? protocol = freezed,
    Object? address = freezed,
    Object? port = freezed,
    Object? connectionId = freezed,
  }) {
    return _then(_ProtocolParams(
      protocol == freezed ? _value.protocol : protocol as String,
      address == freezed ? _value.address : address as String,
      port == freezed ? _value.port : port as int,
      connectionId == freezed ? _value.connectionId : connectionId as int,
    ));
  }
}

/// @nodoc
class _$_ProtocolParams implements _ProtocolParams {
  _$_ProtocolParams(this.protocol, this.address, this.port, this.connectionId);

  @override
  final String protocol;
  @override
  final String address;
  @override
  final int port;
  @override
  final int connectionId;

  @override
  String toString() {
    return 'ProtocolParams(protocol: $protocol, address: $address, port: $port, connectionId: $connectionId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ProtocolParams &&
            (identical(other.protocol, protocol) ||
                const DeepCollectionEquality()
                    .equals(other.protocol, protocol)) &&
            (identical(other.address, address) ||
                const DeepCollectionEquality()
                    .equals(other.address, address)) &&
            (identical(other.port, port) ||
                const DeepCollectionEquality().equals(other.port, port)) &&
            (identical(other.connectionId, connectionId) ||
                const DeepCollectionEquality()
                    .equals(other.connectionId, connectionId)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(protocol) ^
      const DeepCollectionEquality().hash(address) ^
      const DeepCollectionEquality().hash(port) ^
      const DeepCollectionEquality().hash(connectionId);

  @JsonKey(ignore: true)
  @override
  _$ProtocolParamsCopyWith<_ProtocolParams> get copyWith =>
      __$ProtocolParamsCopyWithImpl<_ProtocolParams>(this, _$identity);
}

abstract class _ProtocolParams implements ProtocolParams {
  factory _ProtocolParams(
          String protocol, String address, int port, int connectionId) =
      _$_ProtocolParams;

  @override
  String get protocol;
  @override
  String get address;
  @override
  int get port;
  @override
  int get connectionId;
  @override
  @JsonKey(ignore: true)
  _$ProtocolParamsCopyWith<_ProtocolParams> get copyWith;
}

/// @nodoc
class _$SystemStateTearOff {
  const _$SystemStateTearOff();

  _SystemState call(List<PublisherInfo> publishers,
      List<SubscriberInfo> subscribers, List<ServiceInfo> services) {
    return _SystemState(
      publishers,
      subscribers,
      services,
    );
  }
}

/// @nodoc
const $SystemState = _$SystemStateTearOff();

/// @nodoc
mixin _$SystemState {
  List<PublisherInfo> get publishers;
  List<SubscriberInfo> get subscribers;
  List<ServiceInfo> get services;

  @JsonKey(ignore: true)
  $SystemStateCopyWith<SystemState> get copyWith;
}

/// @nodoc
abstract class $SystemStateCopyWith<$Res> {
  factory $SystemStateCopyWith(
          SystemState value, $Res Function(SystemState) then) =
      _$SystemStateCopyWithImpl<$Res>;
  $Res call(
      {List<PublisherInfo> publishers,
      List<SubscriberInfo> subscribers,
      List<ServiceInfo> services});
}

/// @nodoc
class _$SystemStateCopyWithImpl<$Res> implements $SystemStateCopyWith<$Res> {
  _$SystemStateCopyWithImpl(this._value, this._then);

  final SystemState _value;
  // ignore: unused_field
  final $Res Function(SystemState) _then;

  @override
  $Res call({
    Object? publishers = freezed,
    Object? subscribers = freezed,
    Object? services = freezed,
  }) {
    return _then(_value.copyWith(
      publishers: publishers == freezed
          ? _value.publishers
          : publishers as List<PublisherInfo>,
      subscribers: subscribers == freezed
          ? _value.subscribers
          : subscribers as List<SubscriberInfo>,
      services:
          services == freezed ? _value.services : services as List<ServiceInfo>,
    ));
  }
}

/// @nodoc
abstract class _$SystemStateCopyWith<$Res>
    implements $SystemStateCopyWith<$Res> {
  factory _$SystemStateCopyWith(
          _SystemState value, $Res Function(_SystemState) then) =
      __$SystemStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<PublisherInfo> publishers,
      List<SubscriberInfo> subscribers,
      List<ServiceInfo> services});
}

/// @nodoc
class __$SystemStateCopyWithImpl<$Res> extends _$SystemStateCopyWithImpl<$Res>
    implements _$SystemStateCopyWith<$Res> {
  __$SystemStateCopyWithImpl(
      _SystemState _value, $Res Function(_SystemState) _then)
      : super(_value, (v) => _then(v as _SystemState));

  @override
  _SystemState get _value => super._value as _SystemState;

  @override
  $Res call({
    Object? publishers = freezed,
    Object? subscribers = freezed,
    Object? services = freezed,
  }) {
    return _then(_SystemState(
      publishers == freezed
          ? _value.publishers
          : publishers as List<PublisherInfo>,
      subscribers == freezed
          ? _value.subscribers
          : subscribers as List<SubscriberInfo>,
      services == freezed ? _value.services : services as List<ServiceInfo>,
    ));
  }
}

/// @nodoc
class _$_SystemState implements _SystemState {
  _$_SystemState(this.publishers, this.subscribers, this.services);

  @override
  final List<PublisherInfo> publishers;
  @override
  final List<SubscriberInfo> subscribers;
  @override
  final List<ServiceInfo> services;

  @override
  String toString() {
    return 'SystemState(publishers: $publishers, subscribers: $subscribers, services: $services)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SystemState &&
            (identical(other.publishers, publishers) ||
                const DeepCollectionEquality()
                    .equals(other.publishers, publishers)) &&
            (identical(other.subscribers, subscribers) ||
                const DeepCollectionEquality()
                    .equals(other.subscribers, subscribers)) &&
            (identical(other.services, services) ||
                const DeepCollectionEquality()
                    .equals(other.services, services)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(publishers) ^
      const DeepCollectionEquality().hash(subscribers) ^
      const DeepCollectionEquality().hash(services);

  @JsonKey(ignore: true)
  @override
  _$SystemStateCopyWith<_SystemState> get copyWith =>
      __$SystemStateCopyWithImpl<_SystemState>(this, _$identity);
}

abstract class _SystemState implements SystemState {
  factory _SystemState(
      List<PublisherInfo> publishers,
      List<SubscriberInfo> subscribers,
      List<ServiceInfo> services) = _$_SystemState;

  @override
  List<PublisherInfo> get publishers;
  @override
  List<SubscriberInfo> get subscribers;
  @override
  List<ServiceInfo> get services;
  @override
  @JsonKey(ignore: true)
  _$SystemStateCopyWith<_SystemState> get copyWith;
}

/// @nodoc
class _$PublisherInfoTearOff {
  const _$PublisherInfoTearOff();

  _PublisherInfo call(String topic, List<String> publishers) {
    return _PublisherInfo(
      topic,
      publishers,
    );
  }
}

/// @nodoc
const $PublisherInfo = _$PublisherInfoTearOff();

/// @nodoc
mixin _$PublisherInfo {
  String get topic;
  List<String> get publishers;

  @JsonKey(ignore: true)
  $PublisherInfoCopyWith<PublisherInfo> get copyWith;
}

/// @nodoc
abstract class $PublisherInfoCopyWith<$Res> {
  factory $PublisherInfoCopyWith(
          PublisherInfo value, $Res Function(PublisherInfo) then) =
      _$PublisherInfoCopyWithImpl<$Res>;
  $Res call({String topic, List<String> publishers});
}

/// @nodoc
class _$PublisherInfoCopyWithImpl<$Res>
    implements $PublisherInfoCopyWith<$Res> {
  _$PublisherInfoCopyWithImpl(this._value, this._then);

  final PublisherInfo _value;
  // ignore: unused_field
  final $Res Function(PublisherInfo) _then;

  @override
  $Res call({
    Object? topic = freezed,
    Object? publishers = freezed,
  }) {
    return _then(_value.copyWith(
      topic: topic == freezed ? _value.topic : topic as String,
      publishers: publishers == freezed
          ? _value.publishers
          : publishers as List<String>,
    ));
  }
}

/// @nodoc
abstract class _$PublisherInfoCopyWith<$Res>
    implements $PublisherInfoCopyWith<$Res> {
  factory _$PublisherInfoCopyWith(
          _PublisherInfo value, $Res Function(_PublisherInfo) then) =
      __$PublisherInfoCopyWithImpl<$Res>;
  @override
  $Res call({String topic, List<String> publishers});
}

/// @nodoc
class __$PublisherInfoCopyWithImpl<$Res>
    extends _$PublisherInfoCopyWithImpl<$Res>
    implements _$PublisherInfoCopyWith<$Res> {
  __$PublisherInfoCopyWithImpl(
      _PublisherInfo _value, $Res Function(_PublisherInfo) _then)
      : super(_value, (v) => _then(v as _PublisherInfo));

  @override
  _PublisherInfo get _value => super._value as _PublisherInfo;

  @override
  $Res call({
    Object? topic = freezed,
    Object? publishers = freezed,
  }) {
    return _then(_PublisherInfo(
      topic == freezed ? _value.topic : topic as String,
      publishers == freezed ? _value.publishers : publishers as List<String>,
    ));
  }
}

/// @nodoc
class _$_PublisherInfo implements _PublisherInfo {
  _$_PublisherInfo(this.topic, this.publishers);

  @override
  final String topic;
  @override
  final List<String> publishers;

  @override
  String toString() {
    return 'PublisherInfo(topic: $topic, publishers: $publishers)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PublisherInfo &&
            (identical(other.topic, topic) ||
                const DeepCollectionEquality().equals(other.topic, topic)) &&
            (identical(other.publishers, publishers) ||
                const DeepCollectionEquality()
                    .equals(other.publishers, publishers)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(topic) ^
      const DeepCollectionEquality().hash(publishers);

  @JsonKey(ignore: true)
  @override
  _$PublisherInfoCopyWith<_PublisherInfo> get copyWith =>
      __$PublisherInfoCopyWithImpl<_PublisherInfo>(this, _$identity);
}

abstract class _PublisherInfo implements PublisherInfo {
  factory _PublisherInfo(String topic, List<String> publishers) =
      _$_PublisherInfo;

  @override
  String get topic;
  @override
  List<String> get publishers;
  @override
  @JsonKey(ignore: true)
  _$PublisherInfoCopyWith<_PublisherInfo> get copyWith;
}

/// @nodoc
class _$SubscriberInfoTearOff {
  const _$SubscriberInfoTearOff();

  _SubscriberInfo call(String topic, List<String> subscibers) {
    return _SubscriberInfo(
      topic,
      subscibers,
    );
  }
}

/// @nodoc
const $SubscriberInfo = _$SubscriberInfoTearOff();

/// @nodoc
mixin _$SubscriberInfo {
  String get topic;
  List<String> get subscibers;

  @JsonKey(ignore: true)
  $SubscriberInfoCopyWith<SubscriberInfo> get copyWith;
}

/// @nodoc
abstract class $SubscriberInfoCopyWith<$Res> {
  factory $SubscriberInfoCopyWith(
          SubscriberInfo value, $Res Function(SubscriberInfo) then) =
      _$SubscriberInfoCopyWithImpl<$Res>;
  $Res call({String topic, List<String> subscibers});
}

/// @nodoc
class _$SubscriberInfoCopyWithImpl<$Res>
    implements $SubscriberInfoCopyWith<$Res> {
  _$SubscriberInfoCopyWithImpl(this._value, this._then);

  final SubscriberInfo _value;
  // ignore: unused_field
  final $Res Function(SubscriberInfo) _then;

  @override
  $Res call({
    Object? topic = freezed,
    Object? subscibers = freezed,
  }) {
    return _then(_value.copyWith(
      topic: topic == freezed ? _value.topic : topic as String,
      subscibers: subscibers == freezed
          ? _value.subscibers
          : subscibers as List<String>,
    ));
  }
}

/// @nodoc
abstract class _$SubscriberInfoCopyWith<$Res>
    implements $SubscriberInfoCopyWith<$Res> {
  factory _$SubscriberInfoCopyWith(
          _SubscriberInfo value, $Res Function(_SubscriberInfo) then) =
      __$SubscriberInfoCopyWithImpl<$Res>;
  @override
  $Res call({String topic, List<String> subscibers});
}

/// @nodoc
class __$SubscriberInfoCopyWithImpl<$Res>
    extends _$SubscriberInfoCopyWithImpl<$Res>
    implements _$SubscriberInfoCopyWith<$Res> {
  __$SubscriberInfoCopyWithImpl(
      _SubscriberInfo _value, $Res Function(_SubscriberInfo) _then)
      : super(_value, (v) => _then(v as _SubscriberInfo));

  @override
  _SubscriberInfo get _value => super._value as _SubscriberInfo;

  @override
  $Res call({
    Object? topic = freezed,
    Object? subscibers = freezed,
  }) {
    return _then(_SubscriberInfo(
      topic == freezed ? _value.topic : topic as String,
      subscibers == freezed ? _value.subscibers : subscibers as List<String>,
    ));
  }
}

/// @nodoc
class _$_SubscriberInfo implements _SubscriberInfo {
  _$_SubscriberInfo(this.topic, this.subscibers);

  @override
  final String topic;
  @override
  final List<String> subscibers;

  @override
  String toString() {
    return 'SubscriberInfo(topic: $topic, subscibers: $subscibers)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SubscriberInfo &&
            (identical(other.topic, topic) ||
                const DeepCollectionEquality().equals(other.topic, topic)) &&
            (identical(other.subscibers, subscibers) ||
                const DeepCollectionEquality()
                    .equals(other.subscibers, subscibers)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(topic) ^
      const DeepCollectionEquality().hash(subscibers);

  @JsonKey(ignore: true)
  @override
  _$SubscriberInfoCopyWith<_SubscriberInfo> get copyWith =>
      __$SubscriberInfoCopyWithImpl<_SubscriberInfo>(this, _$identity);
}

abstract class _SubscriberInfo implements SubscriberInfo {
  factory _SubscriberInfo(String topic, List<String> subscibers) =
      _$_SubscriberInfo;

  @override
  String get topic;
  @override
  List<String> get subscibers;
  @override
  @JsonKey(ignore: true)
  _$SubscriberInfoCopyWith<_SubscriberInfo> get copyWith;
}

/// @nodoc
class _$ServiceInfoTearOff {
  const _$ServiceInfoTearOff();

  _ServiceInfo call(String service, List<String> serviceProviders) {
    return _ServiceInfo(
      service,
      serviceProviders,
    );
  }
}

/// @nodoc
const $ServiceInfo = _$ServiceInfoTearOff();

/// @nodoc
mixin _$ServiceInfo {
  String get service;
  List<String> get serviceProviders;

  @JsonKey(ignore: true)
  $ServiceInfoCopyWith<ServiceInfo> get copyWith;
}

/// @nodoc
abstract class $ServiceInfoCopyWith<$Res> {
  factory $ServiceInfoCopyWith(
          ServiceInfo value, $Res Function(ServiceInfo) then) =
      _$ServiceInfoCopyWithImpl<$Res>;
  $Res call({String service, List<String> serviceProviders});
}

/// @nodoc
class _$ServiceInfoCopyWithImpl<$Res> implements $ServiceInfoCopyWith<$Res> {
  _$ServiceInfoCopyWithImpl(this._value, this._then);

  final ServiceInfo _value;
  // ignore: unused_field
  final $Res Function(ServiceInfo) _then;

  @override
  $Res call({
    Object? service = freezed,
    Object? serviceProviders = freezed,
  }) {
    return _then(_value.copyWith(
      service: service == freezed ? _value.service : service as String,
      serviceProviders: serviceProviders == freezed
          ? _value.serviceProviders
          : serviceProviders as List<String>,
    ));
  }
}

/// @nodoc
abstract class _$ServiceInfoCopyWith<$Res>
    implements $ServiceInfoCopyWith<$Res> {
  factory _$ServiceInfoCopyWith(
          _ServiceInfo value, $Res Function(_ServiceInfo) then) =
      __$ServiceInfoCopyWithImpl<$Res>;
  @override
  $Res call({String service, List<String> serviceProviders});
}

/// @nodoc
class __$ServiceInfoCopyWithImpl<$Res> extends _$ServiceInfoCopyWithImpl<$Res>
    implements _$ServiceInfoCopyWith<$Res> {
  __$ServiceInfoCopyWithImpl(
      _ServiceInfo _value, $Res Function(_ServiceInfo) _then)
      : super(_value, (v) => _then(v as _ServiceInfo));

  @override
  _ServiceInfo get _value => super._value as _ServiceInfo;

  @override
  $Res call({
    Object? service = freezed,
    Object? serviceProviders = freezed,
  }) {
    return _then(_ServiceInfo(
      service == freezed ? _value.service : service as String,
      serviceProviders == freezed
          ? _value.serviceProviders
          : serviceProviders as List<String>,
    ));
  }
}

/// @nodoc
class _$_ServiceInfo implements _ServiceInfo {
  _$_ServiceInfo(this.service, this.serviceProviders);

  @override
  final String service;
  @override
  final List<String> serviceProviders;

  @override
  String toString() {
    return 'ServiceInfo(service: $service, serviceProviders: $serviceProviders)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ServiceInfo &&
            (identical(other.service, service) ||
                const DeepCollectionEquality()
                    .equals(other.service, service)) &&
            (identical(other.serviceProviders, serviceProviders) ||
                const DeepCollectionEquality()
                    .equals(other.serviceProviders, serviceProviders)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(service) ^
      const DeepCollectionEquality().hash(serviceProviders);

  @JsonKey(ignore: true)
  @override
  _$ServiceInfoCopyWith<_ServiceInfo> get copyWith =>
      __$ServiceInfoCopyWithImpl<_ServiceInfo>(this, _$identity);
}

abstract class _ServiceInfo implements ServiceInfo {
  factory _ServiceInfo(String service, List<String> serviceProviders) =
      _$_ServiceInfo;

  @override
  String get service;
  @override
  List<String> get serviceProviders;
  @override
  @JsonKey(ignore: true)
  _$ServiceInfoCopyWith<_ServiceInfo> get copyWith;
}

import 'dart:convert';
import 'dart:io';

import 'package:dartros/dartros.dart';
import 'package:dartx/dartx.dart';
import 'package:std_msgs/msgs.dart' hide Duration;
import 'package:test/test.dart';

import 'helpers/messages.dart';
import 'helpers/python_runner.dart';

void main() {
  late Process roscore;
  late NodeHandle nh;

  group('Different MASTER URI', () {
    const rosMasterURI = 'http://localhost:6001';
    final env = {'ROS_MASTER_URI': rosMasterURI};
    setUpAll(() async {
      roscore = await startRosCore2();

      await Future.delayed(2.seconds);
      nh = await initNode('my_node2', [], rosMasterUri: rosMasterURI);
    });
    tearDownAll(() async {
      roscore.kill();
    });

    group('Parameter Server Tests', () {
      test('Can set parameter', () async {
        final result = await nh.setParam('/foo', 'some value');
        expect(result, true);
      });
      test('Can get parameter', () async {
        final value = await nh.getParam('/foo');
        expect(value, 'some value');
      });
    });

    group('Publisher Tests', () {
      test('Publisher Works', () async {
        final sub = await Process.start('rostopic', ['echo', 'chatter'],
            runInShell: true, environment: env);
        final subStream = sub.stdout
            .transform(utf8.decoder)
            .transform(const LineSplitter())
            .asBroadcastStream();

        final chatter =
            nh.advertise<StringMessage>('chatter', StringMessage.$prototype);
        await Future.delayed(2.seconds);
        chatter.publish(StringMessage(data: 'message'), 1);
        await expectLater(subStream, emits('data: "message"'));
        sub.kill();
      });
    });

    group('Subscriber Tests', () {
      test('Subscriber Works', () async {
        final pub = await Process.start(
            'rostopic', ['pub', '/hello', 'std_msgs/String', "data: 'hi'"],
            runInShell: true, environment: env);
        await Future.delayed(2.seconds);
        final chatter = nh.subscribe<StringMessage>(
            'hello', StringMessage.$prototype, (_) {});
        final subStream =
            chatter.messageStream.asBroadcastStream().map((s) => s.data);
        await expectLater(subStream, emits('hi'));
        pub.kill();
      });
    });

    group('Service Tests', () {
      test('ServerClient Works', () async {
        var first = true;
        final _ = nh.advertiseService<MoveBlockRequest, MoveBlockResponse>(
            '/move_bloc', MoveBlock.empty$, (req) {
          if (first) {
            expect(req.color, 0);
            expect(req.shape, 1);
            first = false;
            return MoveBlockResponse(wasSuccessful: false, outOfReach: true);
          }

          expect(req.color, 1);
          expect(req.shape, 2);
          return MoveBlockResponse(wasSuccessful: true, outOfReach: false);
        });
        final request = MoveBlockRequest(color: 0, shape: 1);
        await Future.delayed(2.seconds);
        final moveBloc =
            nh.serviceClient('/move_bloc', MoveBlock.empty$, persist: true);

        var response = await moveBloc(request);
        expect(response.wasSuccessful, false);
        expect(response.outOfReach, true);
        response = await moveBloc(request
          ..color = 1
          ..shape = 2);
        expect(response.wasSuccessful, true);
        expect(response.outOfReach, false);
      });
    });
  });
}

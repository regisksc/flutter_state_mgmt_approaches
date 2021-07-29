import 'package:flutter_test/flutter_test.dart';
import 'package:value_notifier/page/widgets/countdown_view/countdown_view_controller.dart';
import 'package:value_notifier/shared/adapters/di_adapter.dart';

import '../../../utils/test_setup.dart';

void main() {
  late CountdownViewController _controller;
  setUpAll(() {
    initDependencies();
    _controller = DiAdapter().get();
  });
  test(
    'should start timer',
    () async {
      // act
      _controller.start();

      // assert
      expect(_controller.timerState.value, TimerState.running);
    },
  );

  test(
    'should pause timer',
    () async {
      // act
      _controller.pause();

      // assert
      expect(_controller.timerState.value, TimerState.paused);
    },
  );
}

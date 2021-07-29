import 'package:flutter_test/flutter_test.dart';
import 'package:value_notifier/page/timer_controller.dart';

void main() {
  test(
    'should have InputTimeStep as initial state',
    () async {
      // arrange
      final timerController = TimerController();

      // assert
      expect(timerController.timerStep.value, isA<InputTimeStep>());
    },
  );
}

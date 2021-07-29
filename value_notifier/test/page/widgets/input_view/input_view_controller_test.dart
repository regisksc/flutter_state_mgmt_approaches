import 'package:flutter_test/flutter_test.dart';
import 'package:value_notifier/shared/adapters/di_adapter.dart';
import 'package:value_notifier/shared/constants/constants.dart';
import 'package:value_notifier/page/notifiers/timer_step_notifier.dart';
import 'package:value_notifier/page/widgets/input_view/input_view_controller.dart';

import '../../../utils/test_setup.dart';

void main() {
  setUpAll(() {
    initDependencies();
  });
  test(
    'should behave as expected when tapping start button',
    () async {
      // arrange
      final controller = DiAdapter().get<TimerInputViewController>();
      // act
      controller.onSend();
      await Future.delayed(Constants.fadeTransitionDuration);
      // assert
      expect(controller.showPageContent.value, equals(false));
      expect(controller.countdownController.showPageContent.value, true);
      expect(controller.timerController.timerStep.value, isA<CountdownViewStep>());
    },
  );
}

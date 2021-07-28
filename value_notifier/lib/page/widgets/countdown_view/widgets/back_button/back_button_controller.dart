import 'package:get_it/get_it.dart';
import 'package:value_notifier/page/logic/notifiers/timer_step_notifier.dart';
import 'package:value_notifier/page/timer_controller.dart';
import 'package:value_notifier/page/widgets/countdown_view/countdown_view_controller.dart';
import 'package:value_notifier/page/widgets/input_view/input_view_controller.dart';
import 'package:value_notifier/shared/constants/constants.dart';

class BackButtonController {
  final TimerController timerController;
  final TimerInputViewController timerInputViewController;
  final CountdownViewController countdownViewController;
  BackButtonController(this.timerController, this.timerInputViewController, this.countdownViewController);

  void changeTimer() {
    countdownViewController.showPageContent.value = false;
    countdownViewController.stopTimer();
    Future.delayed(Constants.fadeTransitionDuration, () {
      timerInputViewController.showPageContent.value = true;
      timerController.timerStep.value = InputTimeStep();
    });
  }
}

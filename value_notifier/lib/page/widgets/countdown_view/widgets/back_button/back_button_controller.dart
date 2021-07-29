import '/page/timer_controller.dart';
import '../../../../../shared/constants/constants.dart';
import '../../../../notifiers/timer_step_notifier.dart';
import '../../../input_view/input_view_controller.dart';
import '../../countdown_view_controller.dart';

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

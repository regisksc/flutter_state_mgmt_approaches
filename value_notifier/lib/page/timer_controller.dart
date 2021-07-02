import 'package:flutter/foundation.dart';
import 'package:value_notifier/page/logic/notifiers/timer_step_notifier.dart';

class TimerController {
  final timerStep = ValueNotifier<TimerStep>(InputTimeStep());
}

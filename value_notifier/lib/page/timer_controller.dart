import 'package:flutter/foundation.dart';

import 'notifiers/timer_step_notifier.dart';

class TimerController {
  final timerStep = ValueNotifier<TimerStep>(InputTimeStep());
}

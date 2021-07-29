import 'package:flutter/foundation.dart';

abstract class TimerStep {}

class InputTimeStep extends TimerStep {}

class CountdownViewStep extends TimerStep {}

class TimerController {
  final timerStep = ValueNotifier<TimerStep>(InputTimeStep());
}

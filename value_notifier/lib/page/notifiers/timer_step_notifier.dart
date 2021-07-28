import 'package:flutter/material.dart';

abstract class TimerStep {}

class InputTimeStep extends TimerStep {}

class CountdownViewStep extends TimerStep {}

class TimerStepNotifier extends ValueNotifier<TimerStep> {
  TimerStepNotifier([TimerStep? value]) : super(InputTimeStep());
}

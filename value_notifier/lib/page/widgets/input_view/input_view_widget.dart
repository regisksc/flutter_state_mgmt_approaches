import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../shared/constants/constants.dart';
import '../../../shared/widgets/field_widget.dart';
import '../countdown_view/countdown_view_controller.dart';
import 'input_view_controller.dart';

class TimerInputView extends StatelessWidget {
  TimerInputView({
    Key? key,
  }) : super(key: key);

  final controller = GetIt.instance.get<TimerInputViewController>();
  final countdownController = GetIt.instance.get<CountdownViewController>();

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: controller.showPageContent,
        builder: (_, __) {
          return AnimatedOpacity(
            opacity: controller.showPageContent.value ? 1 : 0,
            duration: Constants.fadeTransitionDuration,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DescriptionLabel(),
                Field(onChanged: onTypeTimer, maxLength: 4),
                SizedBox(height: 100),
                StartTimerButton(controller)
              ],
            ),
          );
        });
  }

  onTypeTimer(text) => controller.setTimer(
        int.tryParse(text) ?? Constants.defaultTimerAmountOfSeconds,
      );
}

class StartTimerButton extends StatelessWidget {
  const StartTimerButton(this.controller);
  final TimerInputViewController controller;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: SizedBox(
        width: 140,
        height: 50,
        child: ElevatedButton.icon(
          onPressed: controller.onSend,
          icon: Icon(Icons.play_arrow_rounded),
          label: Text('Start', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}

class DescriptionLabel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Text(
          'Input countdown time in seconds:',
          style: TextStyle(
            fontSize: 14,
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.bold,
            letterSpacing: .5,
          ),
        ),
      ),
    );
  }
}

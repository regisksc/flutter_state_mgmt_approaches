import 'package:flutter/material.dart';

import '../../../shared/constants/constants.dart';
import 'input_view_controller.dart';
import 'widgets/description_label_widget.dart';
import 'widgets/field_widget.dart';

class TimerInputView extends StatelessWidget {
  TimerInputView({Key? key, required TimerInputViewController controller}) : _controller = controller;
  final TimerInputViewController _controller;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        key: ValueKey("InputViewListener"),
        animation: _controller.showPageContent,
        builder: (_, __) {
          return AnimatedOpacity(
            opacity: _controller.showPageContent.value ? 1 : 0,
            duration: Constants.fadeTransitionDuration,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DescriptionLabel(),
                Field(onChanged: _onTypeTimer, maxLength: 4),
                SizedBox(height: 100),
                StartTimerButton(_controller)
              ],
            ),
          );
        });
  }

  _onTypeTimer(text) => _controller.setTimer(
        int.tryParse(text) ?? Constants.defaultTimerAmountOfSeconds,
      );
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

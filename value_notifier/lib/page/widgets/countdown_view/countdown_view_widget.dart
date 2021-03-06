import 'package:flutter/material.dart';
import 'package:value_notifier/shared/adapters/di_adapter.dart';
import 'package:value_notifier/shared/constants/constants.dart';

import 'countdown_view_controller.dart';
import 'widgets/back_button/back_button_widget.dart';
import 'widgets/button_row/button_row_widget.dart';
import 'widgets/countdown/countdown_widget.dart';

class TimerCountdownView extends StatelessWidget {
  TimerCountdownView({
    Key? key,
  }) : super(key: key);

  final controller = DiAdapter().get<CountdownViewController>();

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller.showPageContent,
      builder: (context, child) {
        return AnimatedOpacity(
          opacity: controller.showPageContent.value ? 1 : 0,
          duration: Constants.fadeTransitionDuration,
          child: OrientationBuilder(
            builder: (_, orientation) => orientation == Orientation.portrait
                ? PortraitCountdownView(controller)
                : LandscapeCountdownView(controller),
          ),
        );
      },
    );
  }
}

class PortraitCountdownView extends StatelessWidget {
  const PortraitCountdownView(this.controller);
  final CountdownViewController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BackButtonWidget(),
        Spacer(),
        CountdownWidget(),
        SizedBox(height: 50),
        ButtonRow(controller: controller),
        Spacer(flex: 2),
      ],
    );
  }
}

class LandscapeCountdownView extends StatelessWidget {
  const LandscapeCountdownView(this.controller);
  final CountdownViewController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Column(
          children: [
            BackButtonWidget(),
            const Spacer(),
          ],
        ),
        Expanded(flex: 10, child: CountdownWidget()),
        ButtonRow(controller: controller),
        Spacer(),
      ],
    );
  }
}

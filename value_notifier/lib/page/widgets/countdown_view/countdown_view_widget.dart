import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:value_notifier/page/widgets/countdown_view/countdown_view_controller.dart';

import 'widgets/button_row/button_row_widget.dart';
import 'widgets/countdown/countdown_widget.dart';

class TimerCountdownView extends StatelessWidget {
  TimerCountdownView({
    Key? key,
  }) : super(key: key);

  final controller = GetIt.instance.get<CountdownViewController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        ValueListenableBuilder<int>(
          valueListenable: controller.timeToDisplay,
          builder: (_, timer, __) {
            return CountdownWidget(amountOfSeconds: timer, isPaused: false);
          },
        ),
        SizedBox(height: 50),
        ButtonRow(controller: controller),
        Spacer(),
      ],
    );
  }
}

import 'package:flutter/material.dart';

import 'widgets/button_row/button_row_widget.dart';
import 'widgets/countdown/countdown_widget.dart';

class TimerCountdownView extends StatelessWidget {
  const TimerCountdownView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        CountdownWidget(
          amountOfSeconds: 1,
          isPaused: true,
        ),
        SizedBox(height: 50),
        ButtonRow(),
        Spacer(),
      ],
    );
  }
}

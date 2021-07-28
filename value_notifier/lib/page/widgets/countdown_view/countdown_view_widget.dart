import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:value_notifier/shared/constants/constants.dart';

import 'countdown_view_controller.dart';
import 'widgets/back_button/back_button_widget.dart';
import 'widgets/button_row/button_row_widget.dart';
import 'widgets/countdown/countdown_widget.dart';

class TimerCountdownView extends StatelessWidget {
  TimerCountdownView({
    Key? key,
  }) : super(key: key);

  final controller = GetIt.instance.get<CountdownViewController>();

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller.showPageContent,
      builder: (context, child) {
        return AnimatedOpacity(
          opacity: controller.showPageContent.value ? 1 : 0,
          duration: Constants.fadeTransitionDuration,
          child: Column(
            children: [
              BackButtonWidget(),
              Spacer(),
              CountdownWidget(),
              SizedBox(height: 50),
              ButtonRow(controller: controller),
              Spacer(flex: 2),
            ],
          ),
        );
      },
    );
  }
}

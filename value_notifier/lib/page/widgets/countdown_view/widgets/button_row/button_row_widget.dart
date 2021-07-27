import 'package:flutter/material.dart';
import 'package:value_notifier/page/widgets/countdown_view/countdown_view_controller.dart';

import 'widgets/button_widget.dart';

class ButtonRow extends StatelessWidget {
  final CountdownViewController controller;
  const ButtonRow({
    required this.controller,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: MediaQuery.of(context).size.shortestSide * .8,
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _playOrPauseButton(),
          _restartButton(),
        ],
      ),
    );
  }

  Widget _restartButton() => Align(
        child: Button(
          icon: Icons.restart_alt_sharp,
          onTap: () => controller.restart(),
        ),
      );

  AnimatedBuilder _playOrPauseButton() => AnimatedBuilder(
        animation: controller.timerState,
        builder: (_, __) => Button(
          icon: controller.showPlayButton ? Icons.play_arrow : Icons.pause,
          onTap: () => controller.showPlayButton ? controller.start() : controller.pause(),
        ),
      );
}

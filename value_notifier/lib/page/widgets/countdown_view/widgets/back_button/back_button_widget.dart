import 'package:flutter/material.dart';
import 'package:value_notifier/shared/adapters/di_adapter.dart';

import '../../../../timer_controller.dart';
import '../../../input_view/input_view_controller.dart';
import '../../countdown_view_controller.dart';
import 'back_button_controller.dart';

class BackButtonWidget extends StatelessWidget {
  final controller = BackButtonController(
    DiAdapter().get<TimerController>(),
    DiAdapter().get<TimerInputViewController>(),
    DiAdapter().get<CountdownViewController>(),
  );

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: ElevatedButton(
        onPressed: () => controller.changeTimer(),
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.secondary,
          padding: EdgeInsets.zero,
          shadowColor: Theme.of(context).primaryColor,
          animationDuration: Duration.zero,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        child: Container(
          height: 40,
          width: 100,
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(child: FittedBox(child: Icon(Icons.arrow_back, color: Colors.pink))),
              Spacer(),
              Text("change"),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:value_notifier/page/widgets/countdown_view/countdown_view_controller.dart';
import 'package:value_notifier/page/widgets/countdown_view/widgets/back_button/back_button_controller.dart';
import 'package:value_notifier/page/widgets/input_view/input_view_controller.dart';

import '../../../../timer_controller.dart';

class BackButtonWidget extends StatelessWidget {
  final controller = BackButtonController(
    GetIt.instance.get<TimerController>(),
    GetIt.instance.get<TimerInputViewController>(),
    GetIt.instance.get<CountdownViewController>(),
  );

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: ElevatedButton(
        onPressed: () => controller.changeTimer(),
        style: ElevatedButton.styleFrom(
          primary: Theme.of(context).accentColor,
          padding: EdgeInsets.zero,
          shadowColor: Theme.of(context).primaryColor,
          animationDuration: Duration.zero,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        child: Container(
          height: 40,
          width: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [Icon(Icons.arrow_back), Text("change")],
          ),
        ),
      ),
    );
  }
}

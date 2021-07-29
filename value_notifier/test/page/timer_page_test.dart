import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:value_notifier/page/notifiers/timer_step_notifier.dart';
import 'package:value_notifier/page/timer_controller.dart';
import 'package:value_notifier/page/timer_page.dart';
import 'package:value_notifier/page/widgets/countdown_view/countdown_view_widget.dart';
import 'package:value_notifier/page/widgets/input_view/input_view_widget.dart';
import 'package:value_notifier/shared/adapters/di_adapter.dart';

import '../utils/test_setup.dart';

void main() {
  setUpAll(() {
    initDependencies();
  });

  testWidgets('should render TimerInputView when app loads', (tester) async {
    await loadPage(tester, page: TimerPage());
    expect(find.byType(TimerInputView), findsOneWidget);
  });

  testWidgets('should render all widgets', (tester) async {
    // arrange
    await loadPage(tester, page: TimerPage());

    // act
    final findScaffold = find.byType(Scaffold);
    final scaffold = tester.widget(findScaffold) as Scaffold;

    // assert
    expect(findScaffold, findsOneWidget);
    expect(scaffold.appBar, isNotNull);
    expect(find.byType(TimerInputView), findsOneWidget);
  });

  testWidgets('should render TimerCountdownView when state requires', (tester) async {
    await tester.runAsync(() async {
      // arrange
      await loadPage(tester, page: TimerPage());
      await tester.pump();
      final controller = DiAdapter().get<TimerController>();
      final timerStepInitialState = controller.timerStep.value;

      // act
      controller.timerStep.value = CountdownViewStep();
      await tester.pumpAndSettle();

      // assert
      expect(timerStepInitialState, isA<InputTimeStep>());
      expect(controller.timerStep.value, isA<CountdownViewStep>());
      expect(find.byType(TimerCountdownView), findsOneWidget);
    });
  });
}

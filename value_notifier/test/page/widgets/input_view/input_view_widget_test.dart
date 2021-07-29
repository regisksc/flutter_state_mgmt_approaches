import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:value_notifier/page/widgets/input_view/input_view_controller.dart';
import 'package:value_notifier/page/widgets/input_view/input_view_widget.dart';
import 'package:value_notifier/page/widgets/input_view/widgets/field_widget.dart';
import 'package:value_notifier/shared/adapters/di_adapter.dart';

import '../../../utils/test_setup.dart';

class TimerInputViewControllerMock extends Mock implements TimerInputViewController {}

void main() {
  late final TimerInputViewControllerMock _controller;
  setUpAll(() {
    initDependencies();
    _controller = TimerInputViewControllerMock();
  });
  testWidgets('should render expected widgets', (tester) async {
    // arrange
    final controller = DiAdapter().get<TimerInputViewController>();
    await loadPage(tester, page: TimerInputView(controller: controller));

    // act
    final animatedBuilderFinder = find.byKey(ValueKey("InputViewListener"));
    final descriptionLabelFinder = find.byType(DescriptionLabel);
    final fieldFinder = find.byType(Field);
    final startTimerButtonFinder = find.byType(StartTimerButton);
    final animatedBuilder = tester.widget(animatedBuilderFinder) as AnimatedBuilder;

    // assert
    _expectPageFinds(animatedBuilderFinder, descriptionLabelFinder, fieldFinder, startTimerButtonFinder);
    expect(animatedBuilder.listenable, equals(controller.showPageContent));
  });

  testWidgets('should call controller on interactions', (tester) async {
    // arrange
    when(() => _controller.showPageContent).thenReturn(ValueNotifier(true));
    await loadPage(tester, page: TimerInputView(controller: _controller));
    final input = "1234";

    //act
    await tester.enterText(find.byType(Field), input);
    await tester.pump();
    await tester.tap(find.byType(StartTimerButton));
    await tester.pump();

    // assert
    verify(() => _controller.setTimer(int.parse(input)));
    verify(() => _controller.onSend());
  });
}

void _expectPageFinds(
    Finder animatedBuilderFinder, Finder descriptionLabelFinder, Finder fieldFinder, Finder startTimerButtonFinder) {
  expect(animatedBuilderFinder, findsOneWidget);
  expect(descriptionLabelFinder, findsOneWidget);
  expect(fieldFinder, findsOneWidget);
  expect(startTimerButtonFinder, findsOneWidget);
}

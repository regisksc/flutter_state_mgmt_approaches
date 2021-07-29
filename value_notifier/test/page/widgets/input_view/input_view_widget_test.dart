import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:value_notifier/page/widgets/input_view/input_view_controller.dart';
import 'package:value_notifier/page/widgets/input_view/input_view_widget.dart';
import 'package:value_notifier/page/widgets/input_view/widgets/field_widget.dart';
import 'package:value_notifier/shared/adapters/di_adapter.dart';

import '../../../utils/test_setup.dart';

void main() {
  setUpAll(() {
    initDependencies();
  });
  testWidgets('should render expected widgets', (tester) async {
    // arrange
    await loadPage(tester, page: TimerInputView());
    final controller = DiAdapter().get<TimerInputViewController>();

    //act
    final animatedBuilderFinder = find.byKey(ValueKey("AnimatedBuilder"));
    final descriptionLabelFinder = find.byType(DescriptionLabel);
    final fieldFinder = find.byType(Field);
    final startTimerButtonFinder = find.byType(StartTimerButton);
    final animatedBuilder = tester.widget(animatedBuilderFinder) as AnimatedBuilder;

    // assert
    expect(animatedBuilderFinder, findsOneWidget);
    expect(descriptionLabelFinder, findsOneWidget);
    expect(fieldFinder, findsOneWidget);
    expect(startTimerButtonFinder, findsOneWidget);
    expect(animatedBuilder.listenable, controller.showPageContent);
  });
}

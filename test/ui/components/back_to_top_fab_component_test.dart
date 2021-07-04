import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:look_up/ui/components/back_to_top_fab_component.dart';

void main() {
  testWidgets('Offset change on tap', (WidgetTester tester) async {
    double offset = 400.0;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          floatingActionButton: BackToTopFabComponent(
            key: Key('back-to-top-fab-component'),
            onPressed: () => offset = 0,
          ),
        ),
      ),
    );

    final backToTopFabComponentFinder =
        find.byKey(Key('back-to-top-fab-component'));

    await tester.tap(backToTopFabComponentFinder);
    await tester.pumpAndSettle();

    expect(backToTopFabComponentFinder, findsOneWidget);
    expect(offset, 0);
  });
}

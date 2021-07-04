import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:look_up/ui/components/app_logo_component.dart';

void main() {
  testWidgets('Expect svg icon', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: AppLogoComponent(
            key: Key('app-logo-component'),
          ),
        ),
      ),
    );

    final appLogoComponentFinder = find.byKey(Key('app-logo-component'));
    final appLogoSvgFinder = find.byKey(Key('app-logo-svg'));

    expect(appLogoComponentFinder, findsOneWidget);
    expect(appLogoSvgFinder, findsOneWidget);
  });
}

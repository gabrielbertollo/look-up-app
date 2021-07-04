import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:look_up/ui/pages/home/widgets/appbar_menu_item_widget.dart';

void main() {
  testWidgets('Contains text', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: AppbarMenuItemWidget(
            key: Key('appbar-menu-item-widget'),
            text: 'text',
          ),
        ),
      ),
    );

    final appbarMenuItemWidgetFinder =
        find.byKey(Key('appbar-menu-item-widget'));
    final textFinder = find.text('text');

    expect(appbarMenuItemWidgetFinder, findsOneWidget);
    expect(textFinder, findsOneWidget);
  });
}

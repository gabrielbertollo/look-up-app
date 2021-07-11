import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:look_up/domain/entities/news_entity.dart';
import 'package:look_up/infra/models/news_model.dart';
import 'package:look_up/ui/pages/home/widgets/read_article_button_widget.dart';

void main() {
  testWidgets('Contains url', (WidgetTester tester) async {
    final NewsEntity article = NewsModel.fake();

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ReadArticleButtonWidget(
            key: Key('read-article-button-widget'),
            newsUrl: article.url!,
            cardOpacity: 1,
            textOpacity: 1,
            maxWidth: 800,
          ),
        ),
      ),
    );

    final readArticleButtonFinder =
        find.byKey(Key('read-article-button-widget'));
    final textFinder = find.byKey(Key('read-article-button-text'));

    expect(readArticleButtonFinder, findsOneWidget);
    expect(textFinder, findsOneWidget);
  });
}

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ReadArticleButtonWidget extends StatelessWidget {
  final double cardOpacity;
  final double textOpacity;
  final double maxWidth;
  final String newsUrl;

  const ReadArticleButtonWidget({
    required this.cardOpacity,
    required this.textOpacity,
    required this.maxWidth,
    required this.newsUrl,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () async => await canLaunch(newsUrl)
            ? await launch(newsUrl)
            : throw 'Could not launch $newsUrl',
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            color: Colors.white.withOpacity(cardOpacity),
            child: AnimatedOpacity(
              opacity: textOpacity,
              duration: const Duration(milliseconds: 200),
              child: Padding(
                padding: maxWidth >= 800
                    ? const EdgeInsets.all(8.0)
                    : const EdgeInsets.fromLTRB(20.0, 8.0, 8.0, 8.0),
                child: Text(
                  'READ MORE',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                  key: Key('read-article-button-text'),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

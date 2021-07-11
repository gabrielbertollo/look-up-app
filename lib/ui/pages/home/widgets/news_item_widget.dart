import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../domain/entities/news_entity.dart';
import 'read_article_button_widget.dart';

class NewsItemWidget extends StatefulWidget {
  final NewsEntity news;
  final BoxConstraints constraints;

  const NewsItemWidget({
    required this.news,
    required this.constraints,
    Key? key,
  }) : super(key: key);

  @override
  _NewsItemWidgetState createState() => _NewsItemWidgetState();
}

class _NewsItemWidgetState extends State<NewsItemWidget> {
  double cardOpacity = 0.0;
  double textOpacity = 0.0;
  double backgroundOpacity = 0.0;
  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 300), () {
      setState(() {
        cardOpacity = 0.4;
        backgroundOpacity = 1.0;
      });
    });
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        textOpacity = 1.0;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: widget.constraints.maxHeight,
          width: widget.constraints.maxWidth,
          child: AnimatedOpacity(
            opacity: backgroundOpacity,
            duration: const Duration(milliseconds: 200),
            child: Image(
              image: NetworkImage(
                widget.news.imageUrl!,
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          bottom: 50,
          left: widget.constraints.maxWidth >= 800 ? 120 : 0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: widget.constraints.maxWidth >= 800
                      ? 500
                      : widget.constraints.maxWidth / 1.2,
                ),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  color: Colors.white.withOpacity(cardOpacity),
                  child: Padding(
                    padding: widget.constraints.maxWidth >= 800
                        ? const EdgeInsets.all(8.0)
                        : const EdgeInsets.fromLTRB(20.0, 8.0, 8.0, 8.0),
                    child: AnimatedOpacity(
                      opacity: textOpacity,
                      duration: const Duration(milliseconds: 200),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.news.newsSite.toUpperCase()),
                          Text(
                            widget.news.title,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          Text(widget.news.summary),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              DateFormat('MMMM d, y')
                                  .format(widget.news.publishedAt!),
                              style: TextStyle(
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              if (widget.news.url != null)
                ReadArticleButtonWidget(
                  cardOpacity: cardOpacity,
                  textOpacity: textOpacity,
                  maxWidth: widget.constraints.maxWidth,
                  newsUrl: widget.news.url!,
                )
            ],
          ),
        ),
      ],
    );
  }
}

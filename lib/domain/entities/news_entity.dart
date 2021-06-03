import 'package:flutter/cupertino.dart';

class NewsEntity {
  final int? id;
  final String? title;
  final String? url;
  final String? imageUrl;
  final String? newsSite;
  final String? summary;
  final DateTime? publishedAt;
  final DateTime? updatedAt;
  final bool? featured;

  NewsEntity({
    @required this.id,
    @required this.title,
    @required this.url,
    @required this.imageUrl,
    @required this.newsSite,
    @required this.summary,
    @required this.publishedAt,
    @required this.updatedAt,
    @required this.featured,
  });
}

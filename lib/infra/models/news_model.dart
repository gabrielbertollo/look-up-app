import 'package:faker/faker.dart';

import '../../domain/entities/news_entity.dart';

class NewsModel extends NewsEntity {
  NewsModel({
    required int id,
    required String title,
    required String url,
    required String imageUrl,
    required String newsSite,
    required String summary,
    required DateTime publishedAt,
    required DateTime updatedAt,
    required bool featured,
  }) : super(
          id: id,
          title: title,
          url: url,
          imageUrl: imageUrl,
          newsSite: newsSite,
          summary: summary,
          publishedAt: publishedAt,
          updatedAt: updatedAt,
          featured: featured,
        );

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      id: json['id'],
      title: json['title'],
      url: json['url'],
      imageUrl: json['imageUrl'],
      newsSite: json['newsSite'],
      summary: json['summary'],
      publishedAt: DateTime.parse(json['publishedAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      featured: json['featured'],
    );
  }

  factory NewsModel.fake() {
    final faker = Faker();

    return NewsModel(
      id: faker.randomGenerator.integer(999),
      title: faker.lorem.sentence(),
      url: faker.internet.httpsUrl(),
      imageUrl: faker.image.image(),
      newsSite: faker.lorem.word(),
      summary: faker.lorem.sentence(),
      publishedAt: faker.date.dateTime(),
      updatedAt: faker.date.dateTime(),
      featured: faker.randomGenerator.boolean(),
    );
  }

  static List<NewsModel> fakeList(int length) {
    return List<NewsModel>.generate(
      length,
      (index) => NewsModel.fake(),
    );
  }
}

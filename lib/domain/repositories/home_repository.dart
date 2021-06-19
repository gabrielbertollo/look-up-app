import '../entities/news_entity.dart';

abstract class IHomeRepository {
  Future<List<NewsEntity>> getNews({int page = 1});
}

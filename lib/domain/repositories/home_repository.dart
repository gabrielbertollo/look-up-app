import '../entities/news_entity.dart';

abstract class IHomeRepository {
  Future<List<NewsEntity>> getNews({
    required int page,
    required int pageSize,
  });
}

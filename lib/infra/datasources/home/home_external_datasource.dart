import '../../../domain/entities/news_entity.dart';

abstract class IHomeExternalDatasource {
  Future<List<NewsEntity>> getNews({required int page});
}

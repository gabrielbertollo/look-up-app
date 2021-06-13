import '../../../app/shared/paginated_result.dart';
import '../../../domain/entities/news_entity.dart';

abstract class IHomeExternalDatasource {
  Future<PaginatedResult<NewsEntity>> getNews({int page});
}

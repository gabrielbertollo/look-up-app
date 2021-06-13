import '../../app/shared/paginated_result.dart';
import '../entities/news_entity.dart';

abstract class IHomeRepository {
  Future<PaginatedResult<NewsEntity>> getNews({int page = 1});
}

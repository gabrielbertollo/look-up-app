import '../../../app/shared/paginated_result.dart';
import '../../entities/news_entity.dart';
import '../../repositories/home_repository.dart';

class GetNewsUsecase {
  final IHomeRepository _homeRepository;

  GetNewsUsecase({
    required IHomeRepository homeRepository,
  }) : _homeRepository = homeRepository;

  Future<PaginatedResult<NewsEntity>> call({
    int page = 1,
  }) async {
    return await _homeRepository.getNews(page: page);
  }
}

import '../../entities/news_entity.dart';
import '../../repositories/home_repository.dart';

class GetNewsUsecase {
  final IHomeRepository _homeRepository;

  GetNewsUsecase({
    required IHomeRepository homeRepository,
  }) : _homeRepository = homeRepository;

  Future<List<NewsEntity>> call({
    int page = 0,
    int pageSize = 5,
    String search = '',
  }) async {
    return await _homeRepository.getNews(
      page: page,
      pageSize: pageSize,
      search: search,
    );
  }
}

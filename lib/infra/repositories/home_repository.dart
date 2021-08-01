import '../../domain/entities/news_entity.dart';
import '../../domain/repositories/home_repository.dart';
import '../datasources/home/home_external_datasource.dart';

class HomeRepository implements IHomeRepository {
  final IHomeExternalDatasource _homeExternalDatasource;

  HomeRepository({
    required IHomeExternalDatasource homeExternalDatasource,
  }) : _homeExternalDatasource = homeExternalDatasource;

  @override
  Future<List<NewsEntity>> getNews({
    required int page,
    required int pageSize,
    String search = '',
  }) async {
    return await _homeExternalDatasource.getNews(
      page: page,
      pageSize: pageSize,
      search: search,
    );
  }
}

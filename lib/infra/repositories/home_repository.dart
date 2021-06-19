import '../../domain/entities/news_entity.dart';
import '../../domain/repositories/home_repository.dart';
import '../datasources/home/home_external_datasource.dart';

class HomeRepository implements IHomeRepository {
  final IHomeExternalDatasource _homeExternalDatasource;

  HomeRepository({
    required IHomeExternalDatasource homeExternalDatasource,
  }) : _homeExternalDatasource = homeExternalDatasource;

  @override
  Future<List<NewsEntity>> getNews({int page = 1}) async {
    return await _homeExternalDatasource.getNews(page: page);
  }
}

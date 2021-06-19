import '../../../domain/entities/news_entity.dart';
import '../../../infra/datasources/home/home_external_datasource.dart';
import '../../../infra/models/news_model.dart';

class HomeExternalDatasourceMock implements IHomeExternalDatasource {
  @override
  Future<List<NewsEntity>> getNews({int page = 1}) async {
    await Future.delayed(Duration(milliseconds: 300));

    return NewsModel.fakeList(15);
  }
}

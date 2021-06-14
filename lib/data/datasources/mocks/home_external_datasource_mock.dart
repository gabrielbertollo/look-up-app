import '../../../app/shared/paginated_result.dart';
import '../../../domain/entities/news_entity.dart';
import '../../../infra/datasources/home/home_external_datasource.dart';
import '../../../infra/models/news_model.dart';

class HomeExternalDatasourceMock implements IHomeExternalDatasource {
  int homePage = 0;

  final perPage = 15;
  final lastPage = 3;

  @override
  Future<PaginatedResult<NewsEntity>> getNews({int page = 1}) async {
    await Future.delayed(Duration(milliseconds: 300));

    homePage = page + 1;

    return PaginatedResult<NewsEntity>(
      data: page <= lastPage ? NewsModel.fakeList(15) : [],
      currentPage: page,
      perPage: perPage,
      lastPage: lastPage,
      to: ((page - 1) * 15) + 1,
      from: page * 15,
    );
  }
}

import 'package:flutter_test/flutter_test.dart';
import 'package:look_up/core/modules/home_module.dart';
import 'package:look_up/data/datasources/mocks/home_external_datasource_mock.dart';
import 'package:look_up/domain/entities/news_entity.dart';
import 'package:look_up/domain/repositories/home_repository.dart';
import 'package:look_up/domain/usecases/home/get_news_usecase.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_test/flutter_modular_test.dart';
import 'package:look_up/infra/repositories/home_repository.dart';

void main() {
  group('Test GetNewsUsecase', () {
    late GetNewsUsecase getNewsUsecase;

    setUpAll(() {
      initModule(HomeModule(), replaceBinds: [
        Bind<IHomeRepository>(
          (i) => HomeRepository(
            homeExternalDatasource: HomeExternalDatasourceMock(),
          ),
        ),
      ]);
      getNewsUsecase = Modular.get<GetNewsUsecase>();
    });

    test('Initial result', () async {
      final news = await getNewsUsecase();

      expect(news, isA<List<NewsEntity>>());
    });

    test('Pagination page size', () async {
      int pageSize = 5;
      final news = await getNewsUsecase(pageSize: pageSize);

      expect(news.length, pageSize);
    });
  });
}

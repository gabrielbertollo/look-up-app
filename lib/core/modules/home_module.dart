import 'package:flutter_modular/flutter_modular.dart';

import '../../data/datasources/mocks/home_external_datasource_mock.dart';
import '../../domain/repositories/home_repository.dart';
import '../../domain/usecases/home/get_news_usecase.dart';
import '../../infra/datasources/home/home_external_datasource.dart';
import '../../infra/repositories/home_repository.dart';
import '../../ui/pages/home/home_page.dart';
import '../../ui/pages/home/home_state.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind<HomeState>(
      (i) => HomeState(
        getNewsUsecase: i.get(),
      ),
    ),
    Bind<IHomeRepository>(
      (i) => HomeRepository(
        homeExternalDatasource: i.get(),
      ),
    ),
    Bind<IHomeExternalDatasource>(
      (i) => HomeExternalDatasourceMock(),
    ),
    Bind<GetNewsUsecase>(
      (i) => GetNewsUsecase(
        homeRepository: i.get(),
      ),
    ),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (_, args) => HomePage(),
    ),
  ];
}

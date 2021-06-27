import 'package:dio/dio.dart';

import '../../../domain/entities/news_entity.dart';
import '../../../infra/datasources/home/home_external_datasource.dart';
import '../../../infra/models/news_model.dart';

class HomeExternalDatasource implements IHomeExternalDatasource {
  final url = 'https://api.spaceflightnewsapi.net/v3';

  @override
  Future<List<NewsEntity>> getNews({
    required int page,
    required int pageSize,
  }) async {
    final Response response =
        await Dio().get('$url/articles?_limit=$pageSize&_start=$page');

    return (response.data as Iterable)
        .map((e) => NewsModel.fromJson(e))
        .toList();
  }
}

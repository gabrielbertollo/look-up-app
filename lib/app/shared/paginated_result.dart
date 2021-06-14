import 'package:dio/dio.dart';

import 'deserializer.dart';

class PaginatedResult<T> {
  List<T> data;
  int? currentPage;
  String? path;
  int? from;
  int? to;
  int? perPage;
  int? lastPage;

  PaginatedResult({
    required this.data,
    this.currentPage,
    this.path,
    this.from,
    this.to,
    this.perPage,
    this.lastPage,
  });

  factory PaginatedResult.fromResponse(
    Response response,
    Deserializer<T> deserializer,
  ) {
    final jsonResponse = response.data;
    final data =
        (jsonResponse['data'] as Iterable).map((e) => deserializer(e)).toList();
    final meta = jsonResponse['meta'];
    return PaginatedResult(
      data: data,
      path: meta['path'],
      currentPage: meta['current_page'],
      from: meta['from'],
      to: meta['to'],
      perPage: meta['per_page'],
      lastPage: meta['last_page'],
    );
  }

  bool get isLastPage =>
      (lastPage != null) ? currentPage == lastPage : data.length < perPage!;

  factory PaginatedResult.copy(PaginatedResult copy) => PaginatedResult(
        to: copy.to,
        from: copy.from,
        data: List<T>.from(copy.data),
        perPage: copy.perPage,
        lastPage: copy.lastPage,
        currentPage: copy.currentPage,
        path: copy.path,
      );
}

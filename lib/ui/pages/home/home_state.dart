import 'package:flutter/cupertino.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../domain/entities/news_entity.dart';
import '../../../domain/usecases/home/get_news_usecase.dart';

class HomeState extends ChangeNotifier {
  final GetNewsUsecase _getNewsUsecase;
  final PagingController<int, NewsEntity> _pagingController =
      PagingController(firstPageKey: 0);
  static const int _pageSize = 5;

  PagingController<int, NewsEntity> get pagingController => _pagingController;

  HomeState({
    required GetNewsUsecase getNewsUsecase,
  }) : _getNewsUsecase = getNewsUsecase {
    _init();
  }

  Future<void> _init() async {
    _pagingController.addPageRequestListener(_fetchPage);
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final newsItems = await _getNewsUsecase(
        page: pageKey,
        pageSize: _pageSize,
      );
      final _isLastPage = newsItems.length < _pageSize;

      if (_isLastPage) {
        _pagingController.appendLastPage(newsItems);
      } else {
        final nextPageKey = pageKey + newsItems.length;
        _pagingController.appendPage(newsItems, nextPageKey);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }
}

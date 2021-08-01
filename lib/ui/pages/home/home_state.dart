import 'package:flutter/cupertino.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../domain/entities/news_entity.dart';
import '../../../domain/usecases/home/get_news_usecase.dart';

class HomeState extends ChangeNotifier {
  final GetNewsUsecase _getNewsUsecase;
  final PagingController<int, NewsEntity> _pagingController =
      PagingController(firstPageKey: 0);
  static const int _pageSize = 5;
  String _search = '';
  final selectedCompanyNotifier = ValueNotifier<String>('');

  PagingController<int, NewsEntity> get pagingController => _pagingController;
  String get search => _search;
  String get selectedCompany => selectedCompanyNotifier.value;

  set selectedCompany(String selectedCompany) =>
      selectedCompanyNotifier.value = selectedCompany;

  set search(String search) {
    _search = search;
    _fetchPage(0);
  }

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
        search: search,
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

  void companySearch(String search) {
    if (search == selectedCompany) return refresh();
    _search = search;
    selectedCompany = search;

    _fetchPage(0);
    _pagingController.refresh();
  }

  void refresh() {
    _search = '';
    selectedCompany = '';

    _fetchPage(0);
    _pagingController.refresh();
  }
}

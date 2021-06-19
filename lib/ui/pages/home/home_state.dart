import 'package:flutter/cupertino.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../domain/entities/news_entity.dart';
import '../../../domain/usecases/home/get_news_usecase.dart';

class HomeState extends ChangeNotifier {
  final GetNewsUsecase _getNewsUsecase;

  late final newsListenable = ValueNotifier<List<NewsEntity>>([]);
  final _refreshController = RefreshController();
  int _page = 0;
  bool _isLastPage = false;
  bool _loading = true;
  bool _error = false;

  List<NewsEntity> get news => newsListenable.value;
  RefreshController get refreshController => _refreshController;
  int get page => _page;
  bool get loading => _loading;

  set news(List<NewsEntity> news) => newsListenable.value = news;

  HomeState({
    required GetNewsUsecase getNewsUsecase,
  }) : _getNewsUsecase = getNewsUsecase {
    _init();
  }

  Future<void> _init() async {
    await Future.wait([
      nextPage(),
    ]);
  }

  Future<List<NewsEntity>> _getNews() async {
    return await _getNewsUsecase(page: _page);
  }

  Future<void> nextPage() async {
    try {
      news = await _getNews();
    } catch (e) {
      _error = true;
      rethrow;
    } finally {
      _loading = false;
      newsListenable.notifyListeners();
    }

    // if (_isLastPage) {
    //   _refreshController.loadNoData();
    //   return;
    // }

    // try {
    //   _page++;
    //   final paginatedResult = await _getNews();

    //   news.addAll(paginatedResult.data);
    //   _isLastPage = paginatedResult.isLastPage;
    // } catch (e) {
    //   _error = true;
    //   rethrow;
    // } finally {
    //   _refreshController.loadComplete();
    //   _loading = false;
    //   newsListenable.notifyListeners();
    // }
  }
}

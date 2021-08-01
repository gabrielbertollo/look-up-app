import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../domain/entities/news_entity.dart';
import '../../../theme.dart';
import '../../components/app_logo_component.dart';
import '../../components/back_to_top_fab_component.dart';
import 'home_state.dart';
import 'widgets/appbar_menu_item_widget.dart';
import 'widgets/news_item_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeState state = Modular.get<HomeState>();
  bool _showBackToTopButton = false;
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          if (_scrollController.offset >= 1200) {
            _showBackToTopButton = true;
          } else {
            _showBackToTopButton = false;
          }
        });
      });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToTop() => _scrollController.animateTo(0,
      duration: Duration(milliseconds: 500), curve: Curves.fastOutSlowIn);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 800) {
          return Scaffold(
            extendBodyBehindAppBar: true,
            appBar: PreferredSize(
              preferredSize: Size(constraints.maxWidth, 1000),
              child: Container(
                color: Colors.white.withOpacity(0.2),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: state.refresh,
                          child: AppLogoComponent(size: 40),
                        ),
                      ),
                      ValueListenableBuilder<String>(
                        valueListenable: state.selectedCompanyNotifier,
                        builder: (context, selectedCompany, widget) {
                          return Row(
                            children: [
                              AppbarMenuItemWidget(
                                text: 'SPACEX',
                                onPressed: state.companySearch,
                                selectedItem: selectedCompany,
                              ),
                              AppbarMenuItemWidget(
                                text: 'NASA',
                                onPressed: state.companySearch,
                                selectedItem: selectedCompany,
                              ),
                              AppbarMenuItemWidget(
                                text: 'BLUE ORIGIN',
                                onPressed: state.companySearch,
                                selectedItem: selectedCompany,
                              ),
                              AppbarMenuItemWidget(
                                text: 'VIRGIN GALACTIC',
                                onPressed: state.companySearch,
                                selectedItem: selectedCompany,
                              ),
                              AppbarMenuItemWidget(
                                text: 'ESA',
                                onPressed: state.companySearch,
                                selectedItem: selectedCompany,
                              ),
                            ],
                          );
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
            body: PagedListView<int, NewsEntity>(
              padding: EdgeInsets.only(),
              scrollController: _scrollController,
              pagingController: state.pagingController,
              builderDelegate: PagedChildBuilderDelegate<NewsEntity>(
                itemBuilder: (context, item, index) => NewsItemWidget(
                  news: item,
                  constraints: constraints,
                ),
                firstPageProgressIndicatorBuilder: (_) => Center(
                  child: CircularProgressIndicator(
                    color: ThemeApp.primary,
                  ),
                ),
              ),
            ),
            floatingActionButton: _showBackToTopButton
                ? BackToTopFabComponent(onPressed: _scrollToTop)
                : null,
          );
        }
        return Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: Colors.white.withOpacity(0.2),
            title: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: state.refresh,
                child: AppLogoComponent(),
              ),
            ),
            actions: [
              ValueListenableBuilder<String>(
                valueListenable: state.selectedCompanyNotifier,
                builder: (context, selectedCompany, widget) {
                  return PopupMenuButton(
                    onSelected: (value) =>
                        state.companySearch(value.toString()),
                    itemBuilder: (context) {
                      return [
                        PopupMenuItem(
                          value: 'SPACEX',
                          child: Text(
                            'SPACEX',
                            style: TextStyle(
                              color: selectedCompany == 'SPACEX'
                                  ? ThemeApp.primary
                                  : Colors.black,
                            ),
                          ),
                        ),
                        PopupMenuItem(
                          value: 'NASA',
                          child: Text(
                            'NASA',
                            style: TextStyle(
                              color: selectedCompany == 'NASA'
                                  ? ThemeApp.primary
                                  : Colors.black,
                            ),
                          ),
                        ),
                        PopupMenuItem(
                          value: 'BLUE ORIGIN',
                          child: Text(
                            'BLUE ORIGIN',
                            style: TextStyle(
                              color: selectedCompany == 'BLUE ORIGIN'
                                  ? ThemeApp.primary
                                  : Colors.black,
                            ),
                          ),
                        ),
                        PopupMenuItem(
                          value: 'VIRGIN GALACTIC',
                          child: Text(
                            'VIRGIN GALACTIC',
                            style: TextStyle(
                              color: selectedCompany == 'VIRGIN GALACTIC'
                                  ? ThemeApp.primary
                                  : Colors.black,
                            ),
                          ),
                        ),
                        PopupMenuItem(
                          value: 'ESA',
                          child: Text(
                            'ESA',
                            style: TextStyle(
                              color: selectedCompany == 'ESA'
                                  ? ThemeApp.primary
                                  : Colors.black,
                            ),
                          ),
                        ),
                      ];
                    },
                  );
                },
              )
            ],
          ),
          body: RefreshIndicator(
            onRefresh: () async => state.pagingController.refresh(),
            color: ThemeApp.primary,
            child: PagedListView<int, NewsEntity>(
              scrollController: _scrollController,
              padding: EdgeInsets.only(),
              pagingController: state.pagingController,
              builderDelegate: PagedChildBuilderDelegate<NewsEntity>(
                itemBuilder: (context, item, index) => NewsItemWidget(
                  news: item,
                  constraints: constraints,
                ),
                firstPageProgressIndicatorBuilder: (_) => Center(
                  child: CircularProgressIndicator(
                    color: ThemeApp.primary,
                  ),
                ),
              ),
            ),
          ),
          floatingActionButton: _showBackToTopButton
              ? BackToTopFabComponent(onPressed: _scrollToTop)
              : null,
        );
      },
    );
  }
}

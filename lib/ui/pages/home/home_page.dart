import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../domain/entities/news_entity.dart';
import '../../../theme.dart';
import '../../components/app_logo_component.dart';
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
                      const AppLogoComponent(size: 40),
                      Row(
                        children: [
                          const AppbarMenuItemWidget(text: 'SPACE X'),
                          const AppbarMenuItemWidget(text: 'NASA'),
                          const AppbarMenuItemWidget(text: 'BLUEORIGIN'),
                          const AppbarMenuItemWidget(text: 'VIRGIN GALACTIC'),
                          const AppbarMenuItemWidget(text: 'ESA'),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            body: PagedListView<int, NewsEntity>(
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
          );
        }
        return Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: Colors.white.withOpacity(0.2),
            title: const AppLogoComponent(),
            actions: [
              PopupMenuButton(itemBuilder: (context) {
                return [
                  const PopupMenuItem(child: Text('SPACE X')),
                  const PopupMenuItem(child: Text('NASA')),
                  const PopupMenuItem(child: Text('BLUEORIGIN')),
                  const PopupMenuItem(child: Text('VIRGIN GALACTIC')),
                  const PopupMenuItem(child: Text('ESA'))
                ];
              })
            ],
          ),
          body: RefreshIndicator(
            onRefresh: () async => state.pagingController.refresh(),
            color: ThemeApp.primary,
            child: PagedListView<int, NewsEntity>(
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
        );
      },
    );
  }
}

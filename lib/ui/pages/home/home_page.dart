import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../components/app_logo_component.dart';
import 'widgets/appbar_menu_item_widget.dart';
import 'widgets/news_item_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
            body: Center(
              child: ListView(
                padding: const EdgeInsets.only(),
                children: [
                  NewsItemWidget(constraints: constraints),
                  NewsItemWidget(constraints: constraints),
                  NewsItemWidget(constraints: constraints),
                ],
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
          body: Center(
            child: ListView(
              padding: const EdgeInsets.only(),
              children: [
                NewsItemWidget(constraints: constraints),
                NewsItemWidget(constraints: constraints),
                NewsItemWidget(constraints: constraints),
              ],
            ),
          ),
        );
      },
    );
  }
}

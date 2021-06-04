import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:look_up/ui/components/app_logo_component.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
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
                    AppLogoComponent(size: 40),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text('SPACE X'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text('NASA'),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          body: Center(
            child: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'lib/assets/test_image.jpg',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: SafeArea(
                child: Text(
                  '',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
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

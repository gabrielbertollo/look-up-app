import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewsItemWidget extends StatefulWidget {
  final BoxConstraints constraints;

  const NewsItemWidget({
    required this.constraints,
    Key? key,
  }) : super(key: key);

  @override
  _NewsItemWidgetState createState() => _NewsItemWidgetState();
}

class _NewsItemWidgetState extends State<NewsItemWidget> {
  double cardOpacity = 0.0;
  double textOpacity = 0.0;
  double backgroundOpacity = 0.0;
  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 300), () {
      setState(() {
        cardOpacity = 0.4;
        backgroundOpacity = 1.0;
      });
    });
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        textOpacity = 1.0;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: widget.constraints.maxHeight,
          width: widget.constraints.maxWidth,
          child: AnimatedOpacity(
            opacity: backgroundOpacity,
            duration: const Duration(milliseconds: 200),
            child: const Image(
              image: AssetImage(
                'lib/assets/test_image.jpg',
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: widget.constraints.maxHeight / 1.3,
          left: widget.constraints.maxWidth >= 800 ? 120 : 0,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            color: Colors.white.withOpacity(cardOpacity),
            child: Padding(
              padding: widget.constraints.maxWidth >= 800
                  ? const EdgeInsets.all(8.0)
                  : const EdgeInsets.fromLTRB(20.0, 8.0, 8.0, 8.0),
              child: AnimatedOpacity(
                opacity: textOpacity,
                duration: const Duration(milliseconds: 200),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('COMPANY'),
                    const Text(
                      'TITLE',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const Text('Example text'),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
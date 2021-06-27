import 'package:flutter/material.dart';

class BackToTopFabComponent extends StatelessWidget {
  final Function() onPressed;

  const BackToTopFabComponent({required this.onPressed, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      backgroundColor: Colors.black,
      child: Icon(
        Icons.arrow_upward,
        color: Colors.white,
      ),
    );
  }
}

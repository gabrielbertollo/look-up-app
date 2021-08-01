import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../theme.dart';

class AppbarMenuItemWidget extends StatelessWidget {
  final String text;
  final Function(String search) onPressed;
  final String selectedItem;

  const AppbarMenuItemWidget({
    required this.text,
    required this.onPressed,
    required this.selectedItem,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: TextButton(
          onPressed: () => onPressed(text),
          child: Text(
            text,
            style: TextStyle(
              color: selectedItem == text ? ThemeApp.primary : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}

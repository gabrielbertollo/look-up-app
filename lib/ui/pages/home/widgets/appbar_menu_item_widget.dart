import 'package:flutter/cupertino.dart';

class AppbarMenuItemWidget extends StatelessWidget {
  final String text;

  const AppbarMenuItemWidget({
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(text),
    );
  }
}

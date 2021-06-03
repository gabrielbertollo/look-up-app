import 'package:flutter/material.dart';

abstract class ThemeApp {
  static ThemeData themeData = ThemeData(
    fontFamily: 'Exo',
    accentColor: secondary,
    primaryColor: primary,
  );

  static final primary = Color(0xFFC5523A);
  static final secondary = Color(0xFFDBB624);
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

enum LogoStyle {
  Dark,
  Light,
  Monochrome,
}

class AppLogoComponent extends StatelessWidget {
  final LogoStyle style;
  final double size;
  final Color? color;

  const AppLogoComponent({
    this.style = LogoStyle.Dark,
    this.size = 35,
    this.color,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String logoAsset;
    switch (style) {
      case LogoStyle.Dark:
        logoAsset = 'lib/assets/icons/logo_dark.svg';
        break;
      case LogoStyle.Light:
        logoAsset = 'lib/assets/icons/logo_light.svg';
        break;
      case LogoStyle.Monochrome:
        logoAsset = 'lib/assets/icons/logo_monochrome.svg';
        break;
      default:
        logoAsset = 'lib/assets/icons/logo_monochrome.svg';
    }
    return SvgPicture.asset(
      logoAsset,
      height: size,
      color: color,
    );
  }
}

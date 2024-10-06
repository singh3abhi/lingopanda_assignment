import 'package:flutter/material.dart';

abstract class Fonts {
  static String get poppins => 'Poppins';
}

class TextStyles {
  static TextStyle get poppinExtraBold => TextStyle(fontFamily: Fonts.poppins, fontWeight: FontWeight.w800);
  static TextStyle get poppinBold => TextStyle(fontFamily: Fonts.poppins, fontWeight: FontWeight.w700);
  static TextStyle get poppinSemiBold => TextStyle(fontFamily: Fonts.poppins, fontWeight: FontWeight.w600);
  static TextStyle get poppinMedium => TextStyle(fontFamily: Fonts.poppins, fontWeight: FontWeight.w500);
  static TextStyle get poppinRegular => TextStyle(fontFamily: Fonts.poppins, fontWeight: FontWeight.w400);
  static TextStyle get poppinLight => TextStyle(fontFamily: Fonts.poppins, fontWeight: FontWeight.w300);
}

class ColorConstants {
  static Color blueShadeColor = const Color.fromARGB(255, 12, 84, 190);
  static Color textShadeColor = const Color.fromARGB(255, 48, 63, 96);
  static Color backgroundColor = const Color.fromARGB(255, 245, 249, 253);
  static Color greyShade = const Color.fromARGB(255, 206, 211, 220);
  static Color white = Colors.white;
}

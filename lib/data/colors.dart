import 'package:flutter/material.dart';

class CustomColors {
  static Color background = Color(0xFF2D2E40);
  static Color background2 = Color(0xAA2D2E40);
  static Color secondcolor = Color(0xFFBBCEFE);
}

class GradientColors {
  final List<Color> colors;
  GradientColors(this.colors);

  static List<Color> color_gradient = [Colors.white, CustomColors.secondcolor];
}

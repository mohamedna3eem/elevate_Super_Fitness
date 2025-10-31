
import 'package:flutter/material.dart';

abstract class AppColors {

  static MaterialColor white = const MaterialColor(0xFFF9F9F9, <int, Color>{
    10: Color(0xFFfefefe),
    20: Color(0xFFfdfdfd),
    30: Color(0xFFfcfcfc),
    40: Color(0xFFfbfbfb),
    50: Color(0xFFfafafa),
    60: Color(0xFFd0d0d0),
    70: Color(0xFFa6a6a6),
    80: Color(0xFF7d7d7d),
    90: Color(0xFF535353),
    100: Color(0xFF323232),
  });

  static MaterialColor backGroundL = const MaterialColor(0xFF242424, <int, Color>{
    10: Color(0xFF242424),
    20: Color(0xFF3A3A3A),
    30: Color(0xFF505050),
    40: Color(0xFF666666),
    50: Color(0xFF7C7C7C),
    60: Color(0xFF919191),
    70: Color(0xFFA7A7A7),
    80: Color(0xFFBDBDBD),
    90: Color(0xFFD3D3D3),
    100: Color(0xFFE9E9E9),
  });
  static MaterialColor backGroundD = const MaterialColor(0xFF242424, <int, Color>{
    10: Color(0xFF242424),
    20: Color(0xFF0B0B0B),
    30: Color(0xFF000000),
    40: Color(0xFF000000),
    50: Color(0xFF000000),
    60: Color(0xFF000000),
    70: Color(0xFF000000),
    80: Color(0xFF000000),
    90: Color(0xFF000000),
    100: Color(0xFF000000),
  });

  static MaterialColor mainColorL = const MaterialColor(0xFFFF4100, <int, Color>{
    10: Color(0xFFFF4100),
    20: Color(0xFFFF541A),
    30: Color(0xFFFF6733),
    40: Color(0xFFFF7A4D),
    50: Color(0xFFFF8D66),
    60: Color(0xFFFFA080),
    70: Color(0xFFFFB399),
    80: Color(0xFFFFC6B2),
    90: Color(0xFFFFD9CC),
    100: Color(0xFFFFECE5),
  });
  static MaterialColor mainColorD = const MaterialColor(0xFFFF4100, <int, Color>{
    10: Color(0xFFFF4100),
    20: Color(0xFFE52800),
    30: Color(0xFFCC0E00),
    40: Color(0xFFB20000),
    50: Color(0xFF990000),
    60: Color(0xFF800000),
    70: Color(0xFF660000),
    80: Color(0xFF4D0000),
    90: Color(0xFF330000),
    100: Color(0xFF1A0000),
  });


  static MaterialColor black = const MaterialColor(0xFF0C1015, <int, Color>{
    10: Color(0xFFcecfd0),
    20: Color(0xFFAEAFB1),
    30: Color(0xFF86888a),
    40: Color(0xFF5d6063),
    50: Color(0xFF34383c),
    60: Color(0xFF0a0d12),
    70: Color(0xFF080b0e),
    80: Color(0xFF06080b),
    90: Color(0xFF040507),
    100: Color(0xFF020304),
  });

  static const Color gray = Color(0xFF535353);
  static const Color pureWhite = Color(0xFFFFFFFF);
  static const Color lightGray = Color(0xFFD9D9D9);
  static const Color red = Color(0xffCC1010);
  static const Color green = Color(0xFF0CB359);
  static const Color lightPink = Color(0xFFF9ECF0);
  static const Color yellow = Color(0xFFC8D444);
  static const Color darkGray = Color(0xFF2D2D2D);
}

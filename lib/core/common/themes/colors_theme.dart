import 'package:flutter/material.dart';

abstract class ColorsTheme {
  static const MaterialColor antique = MaterialColor(
    0xfff8e8d4,
    <int, Color>{
      600: Color(0xfff8e8d4),
      700: Color(0xffcf9775),
      800: Color(0xffc69a80),
      900: Color(0xff8c746a),
    },
  );
  static const MaterialColor neutral = MaterialColor(
    0xFF666666,
    <int, Color>{
      100: Color(0xFFFFFFFF),
      200: Color(0xFFF7F7F7),
      300: Color(0xFFC9CCCE),
      400: Color(0xff707070),
      500: Color(0xFF838383),
      600: Color(0xFF666666),
      700: Color(0xFF000000),
    },
  );
  static const MaterialColor scarlet = MaterialColor(
    0xff2d140d,
    <int, Color>{
      700: Color(0xff2d140d),
    },
  );
}

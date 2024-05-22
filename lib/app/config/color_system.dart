import 'package:flutter/material.dart';

abstract class ColorSystem {
  static Color transparent = Colors.transparent;

  static Color white = Colors.white;

  static Color black = Colors.black;

  static const Color lightGrey = Color(0xFF555555);

  static const MaterialColor primary =
      MaterialColor(_primaryValue, <int, Color>{
    50: Color(0xFFE8EAF6),
    100: Color(0xFFC5CAE9),
    200: Color(0xFF9FA8DA),
    300: Color(0xFF7986CB),
    400: Color(0xFF5C6BC0),
    500: Color(0xFF576FD7),
    600: Color(0xFF3949AB),
    700: Color(0xFF303F9F),
    800: Color(0xFF283593),
    900: Color(0xFF1A237E),
  });

  static const int _primaryValue = 0xFF576FD7;

  /// Error Color
  static const MaterialColor error = MaterialColor(
    _errorValue,
    <int, Color>{
      900: Color(0xFF531A1A),
      800: Color(0xFF732828),
      700: Color(0xFF992C2C),
      600: Color(0xFFC53A3A),
      500: Color(0xFFE24A4A),
      400: Color(0xFFF76868),
      300: Color(0xFFFF9595),
      200: Color(0xFFFFB7B7),
      100: Color(0xFFFFD5D5),
      50: Color(0xFFFFE8E8),
    },
  );
  static const int _errorValue = 0xFFE24A4A;

  /// Neutral Color
  static const MaterialColor neutral = MaterialColor(
    _neutralValue,
    <int, Color>{
      900: Color(0xFF313139),
      800: Color(0xFF464655),
      700: Color(0xFF5F5F6F),
      600: Color(0xFF7D7D8E),
      500: Color(0xFF9292A5),
      400: Color(0xFFB1B1C3),
      300: Color(0xFFCBCBD8),
      200: Color(0xFFDBDBE6),
      100: Color(0xFFE9E9F1),
      50: Color(0xFFF2F2F7),
    },
  );
  static const int _neutralValue = 0xFF9292A5;
}

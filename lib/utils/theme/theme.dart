import 'package:flutter/material.dart';

import '../comman/constants/text.dart';


class EAppTheme {
  EAppTheme._();

  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: const Color(0xFFF5F5F5),
    textTheme: ETextTheme.lightTextTheme,
    brightness: Brightness.light,
    primaryColor: const Color(0XFF0CA201),
    // appBarTheme: GAppBarTheme.lightappBarTheme,
    useMaterial3: true,
  );
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: const Color(0xFF000000),
    textTheme: ETextTheme.darkTextTheme,
    brightness: Brightness.dark,
    primaryColor: const Color(0XFF66BB6A),
    useMaterial3: true,
    // appBarTheme: GAppBarTheme.darkappBarTheme,
  );
}

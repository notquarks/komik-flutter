import 'package:flutter/material.dart';

class ThemeClass {
  static ThemeData lightTheme = ThemeData(
      scaffoldBackgroundColor: Colors.white,
      colorScheme: const ColorScheme.light(),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.blue,
      ));

  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    scrollbarTheme: ScrollbarThemeData(
      interactive: true,
      thumbColor: MaterialStateProperty.all(
        const Color.fromRGBO(175, 178, 184, 1.0),
      ),
    ),
    colorScheme: const ColorScheme.dark(),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color.fromRGBO(45, 45, 46, 1.0),
    ),
  );
}

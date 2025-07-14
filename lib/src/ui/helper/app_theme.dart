import 'package:flutter/material.dart';

class MyAppTheme {
  static ThemeData get androidTheme => ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: Color.fromRGBO(30, 98, 57, 1),
      secondary: Color.fromRGBO(81, 144, 106, 1),
      tertiary: Color.fromRGBO(155, 205, 176, 1),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Color.fromRGBO(39, 76, 67, 1),
      foregroundColor: Colors.white,
      elevation: 4,
      shadowColor: Colors.black,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color.fromRGBO(81, 144, 106, 1),
        foregroundColor: Colors.white,
        textStyle: TextStyle(
          fontSize: 20
        )
        // padding: EdgeInsets.all(16)
      ),
    ),
  );

  static ThemeData get iosTheme => ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: Color.fromRGBO(30, 98, 57, 1),
      secondary: Color.fromRGBO(81, 144, 106, 1),
      tertiary: Color.fromRGBO(155, 205, 176, 1),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.grey[200],
      foregroundColor: Colors.black,
      elevation: 0,
      shadowColor: Colors.black,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          backgroundColor: Color.fromRGBO(155, 205, 176, 1),
          foregroundColor: Colors.grey[800],
          textStyle: TextStyle(
              fontSize: 20
          )
        // padding: EdgeInsets.all(16)
      ),
    ),
  );
}

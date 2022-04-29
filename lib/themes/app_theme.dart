import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Color(0xFF0052AB);
  static const Color secondary = Color(0xFF00DCA8);
  //static const Color secondary = Color(0xFF6265EE);

  static final ThemeData lightTheme = ThemeData.light().copyWith(
    // color primario
    primaryColor: primary,
    //appBarTheme
    appBarTheme: const AppBarTheme(
      color: primary,
      elevation: 0,
    ),
    //Todo TextbuttonTheme
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(primary: primary),
    ),
  );

  static final ThemeData darkTheme = ThemeData.dark().copyWith(
    // color primario
    primaryColor: primary,
    textTheme: TextTheme(bodySmall: TextStyle(color: Colors.white)),
    //appBarTheme
    appBarTheme: const AppBarTheme(
      color: primary,
      elevation: 0,
    ),
    cardTheme: const CardTheme(color: Colors.white),

    scaffoldBackgroundColor: Color(0xFF375f8a),

    // inputDecorationTheme: InputDecorationTheme(

    // )
  );
}

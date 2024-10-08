import 'package:flutter/material.dart';

class AppTheme {
  static const Color PrimaryLight = Color(0xffB7935F);
  static const Color PrimaryDark = Color(0xff141A2E);
  static const Color white = Color(0xffF8F8F8);
  static const Color black = Color(0xff242424);
  static const Color gold = Color(0xffFACC1D);

  static ThemeData lightTheme = ThemeData(
    primaryColor: PrimaryLight,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: PrimaryLight,
      selectedItemColor: black,
      unselectedItemColor: white,
    ),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      iconTheme: IconThemeData(color: black),
      titleTextStyle: TextStyle(
        color: black,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
    ),
    textTheme: TextTheme(
      headlineSmall: TextStyle(
        color: black,
        fontSize: 25,
        fontWeight: FontWeight.w400,
      ),
      titleLarge: TextStyle(
        fontSize: 20,
        color: black,
        fontWeight: FontWeight.w400
      )
    ),
  );

  static ThemeData dartTheme = ThemeData(
    primaryColor: PrimaryDark,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: PrimaryDark,
        selectedItemColor: gold,
        unselectedItemColor: white),
  );
}

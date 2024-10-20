import 'package:flutter/material.dart';

class SettingProvider with ChangeNotifier {
  ThemeMode appTheme = ThemeMode.light;
  String currentLanguage = 'en';
  String lightImage = "bg3.png", darkImage = "bg_dark.png";
  String backGroundImage = "bg3.png";
  void changeTheme(ThemeMode newMode) {
    appTheme = newMode;
    if (newMode == ThemeMode.dark)
      backGroundImage = darkImage;
    else
      backGroundImage = lightImage;
    notifyListeners();
  }
  // void changeLanguage(String language)
  // {
  //   currentLanguage = language;
  //   notifyListeners();
  // }
}

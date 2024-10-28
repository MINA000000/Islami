

import 'package:flutter/material.dart';

class SettingProvider with ChangeNotifier {
  ThemeMode appTheme = ThemeMode.light;
  String language = 'en';
  String backGroundImage = "bg3.png";
  void changeTheme(ThemeMode wantedTheme)
  {
    if(wantedTheme==ThemeMode.light) backGroundImage = "bg3.png";
    else backGroundImage = "bg_dark.png";
    appTheme = wantedTheme;
    notifyListeners();
  }
  void changeLanguage(String selectedLanguage)
  {
    language = selectedLanguage;
    notifyListeners();
  }
}

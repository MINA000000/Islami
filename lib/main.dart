import 'package:flutter/material.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/homeScreen.dart';
import 'package:islami/tabs/quran/surah_content_screen.dart';

void main() {
  runApp(Islami());
}

class Islami extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        HomeScreen.routeName: (_) => HomeScreen(),
        SurahContentScreen.routeName  : (_) => SurahContentScreen(),
      },
      initialRoute: HomeScreen.routeName,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.dartTheme,
      themeMode: ThemeMode.light,
    );
  }
}

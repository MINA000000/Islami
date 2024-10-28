import 'package:flutter/material.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/homeScreen.dart';
import 'package:islami/tabs/hadeth/hadeth_content_screen.dart';
import 'package:islami/tabs/quran/surah_content_screen.dart';
import 'package:islami/tabs/setting/setting_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => SettingProvider(),
      child: Islami(),
    ),
  );
}

class Islami extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SettingProvider settingProvider = Provider.of<SettingProvider>(context);
    return MaterialApp(
      routes: {
        HomeScreen.routeName: (_) => HomeScreen(),
        SurahContentScreen.routeName: (_) => SurahContentScreen(),
        HadethContentScreen.routeName: (_) => HadethContentScreen(),
      },
      initialRoute: HomeScreen.routeName,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.dartTheme,
      themeMode: settingProvider.appTheme,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(settingProvider.language),
    );
  }
}

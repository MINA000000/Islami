import 'package:flutter/material.dart';
import 'package:islami/tabs/setting/setting_provider.dart';
import 'package:provider/provider.dart';

class SettingTab extends StatefulWidget {
  @override
  State<SettingTab> createState() => _SettingTabState();
}

class _SettingTabState extends State<SettingTab> {
  bool val = true;

  @override
  Widget build(BuildContext context) {
    SettingProvider settingProvider = Provider.of<SettingProvider>(context);

    List<Language> languages = [
      Language(languageCode: 'ar', languageName: 'Arabic'),
      Language(languageCode: 'en', languageName: 'English')
    ];

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Dartk Theme",
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                Switch(
                  value: settingProvider.appTheme == ThemeMode.dark,
                  onChanged: (value) {
                    if (value == true)
                      settingProvider.changeTheme(ThemeMode.dark);
                    else
                      settingProvider.changeTheme(ThemeMode.light);
                  },
                  activeColor: Colors.pink,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Language",
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                DropdownButtonHideUnderline(
                  child: DropdownButton<Language>(
                    value: languages.firstWhere((element) => element.languageCode==settingProvider.language),
                    items: languages
                        .map(
                          (e) => DropdownMenuItem<Language>(
                            value: e,
                            child: Text(e.languageName),
                          ),
                        )
                        .toList(),
                    onChanged: (language) {
                      if(language!=null)
                      {
                        settingProvider.changeLanguage(language.languageCode);
                      }
                    },
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Language {
  String languageCode;
  String languageName;
  Language({required this.languageCode, required this.languageName});
}

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
    List<Language> languages = [Language(languageCode: 'ar', languageName: 'Arabic'),Language(languageCode: 'en', languageName: 'English')];
    Language selectedLanguage = languages[0];
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Dark Theme',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Switch(
                  value: settingProvider.appTheme == ThemeMode.dark,
                  onChanged: (value) {
                    if (value == false) {
                      settingProvider.changeTheme(ThemeMode.light);
                    } else {
                      settingProvider.changeTheme(ThemeMode.dark);
                    }
                    setState(
                      () {},
                    );
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Language',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                DropdownButton<Language>(
                  
                  hint: Text('Select an item'),
                  value: selectedLanguage,
                  onChanged: (Language? newValue) {
                    selectedLanguage = languages.firstWhere((element) => element.languageCode==newValue); 
                    // settingProvider.changeLanguage(newValue!.languageCode);
                  },
                  items: languages.map<DropdownMenuItem<Language>>((Language value) {
                    return DropdownMenuItem<Language>(
                      value: value,
                      child: Text(value.languageName),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
class Language{
  String languageCode ;
  String languageName ;
  Language({required this.languageCode,required this.languageName});
}

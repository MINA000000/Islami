import 'package:flutter/material.dart';
import 'package:islami/tabs/hadeth/hadeth_tab.dart';
import 'package:islami/tabs/quran/quran_tab.dart';
import 'package:islami/tabs/radio/radio_tab.dart';
import 'package:islami/tabs/sebha/sebha_tab.dart';
import 'package:islami/tabs/setting/setting_provider.dart';
import 'package:islami/tabs/setting/setting_tab.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class HomeScreen extends StatefulWidget {
  static const routeName = '/home';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  List<Widget> tabs = [RadioTab(), SebhaTab(), HadethTab(), QuranTab(),SettingTab()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    SettingProvider settingProvider = Provider.of<SettingProvider>(context);
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/${settingProvider.backGroundImage}'), fit: BoxFit.fill),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.islami),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        backgroundColor: Colors.transparent,

        body: tabs[_selectedIndex],
        
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          onTap: (indx) {
            _selectedIndex = indx;
            setState(() {});
          },
          items: [
            NavigationItem(AppLocalizations.of(context)!.radio,"radio2"),
            NavigationItem(AppLocalizations.of(context)!.sebha,'sebha2'),
            NavigationItem(AppLocalizations.of(context)!.hadeth,'hadeth2'),
            NavigationItem(AppLocalizations.of(context)!.quran,'quran2'),
            BottomNavigationBarItem(icon: Icon(Icons.settings_outlined),label: AppLocalizations.of(context)!.setting),
          ],
        ),
      ),
    );
  }

  BottomNavigationBarItem NavigationItem(String labelName,String iconName) {
    return BottomNavigationBarItem(
      icon: ImageIcon(
        AssetImage('assets/images/$iconName.png'),
      ),
      label:labelName,
    );
  }
}

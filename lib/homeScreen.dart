import 'package:flutter/material.dart';
import 'package:islami/tabs/hadeth/hadeth_tab.dart';
import 'package:islami/tabs/quran/quran_tab.dart';
import 'package:islami/tabs/radio/radio_tab.dart';
import 'package:islami/tabs/sebha/sebha_tab.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  List<Widget> tabs = [RadioTab(), SebhaTab(), HadethTab(), QuranTab()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/bg3.png'), fit: BoxFit.fill),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text('إسلامي'),
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
            NavigationItem('Radio'),
            NavigationItem('Sebha'),
            NavigationItem('Hadeth'),
            NavigationItem('Quran'),
          ],
        ),
      ),
    );
  }

  BottomNavigationBarItem NavigationItem(String iconName) {
    return BottomNavigationBarItem(
      icon: ImageIcon(
        AssetImage('assets/images/$iconName.png'),
      ),
      label: iconName,
    );
  }
}

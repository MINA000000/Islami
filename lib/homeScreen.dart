import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xffB7935F),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/images/radio.png'),
              color: _selectedIndex == 0 ? Colors.black : Colors.white,
            ),
            label: 'Radio',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/images/sebha.png'),
              color: _selectedIndex == 1 ? Colors.black : Colors.white,
            ),
            label: 'Sebha',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/images/quran_quran_svgrepo_com.png'),
              color: _selectedIndex == 2 ? Colors.black : Colors.white,
            ),
            label: 'Quran',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/images/quran.png'),
              color: _selectedIndex == 3 ? Colors.black : Colors.white,
            ),
            label: 'Quran 2',
          ),
        ],
      ),
    );
  }
}

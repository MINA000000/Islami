import 'package:flutter/material.dart';
import 'package:islami/homeScreen.dart';

void main() {
  runApp(Islami());
}

class Islami extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        HomeScreen.routeName :(context) => HomeScreen(),
      },
      initialRoute: HomeScreen.routeName,
    );
  }
}
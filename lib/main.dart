import 'package:flutter/material.dart';
import 'package:flutter_advanced_dart/exercises/exe02_exe03/pages/home_page_exe03.dart';
import 'package:flutter_advanced_dart/exercises/exe05/pages/home_page_coin.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        //'/': (context) => HomePage(),
        '/': (context) => HomePageCoin(),
      },
    );
  }
}

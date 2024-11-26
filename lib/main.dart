import 'package:flutter/material.dart';
import 'package:shop_app_flutter/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopping App',
      theme: ThemeData(
        fontFamily: 'Lato',
        //color scheme is based on seed Color, which will be base color of app
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromRGBO(254, 206, 1, 1))
        ),
      home: const HomePage() ,
    );
  }
}
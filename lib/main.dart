import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_flutter/providers/cart_provider.dart';
import 'package:shop_app_flutter/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

//Provider
//ChangeNotifierProvider
//Future Provider : future subscribe and show the changes
//StreamProvider : stream

//lazy-loading

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
        )
      ],
      child: MaterialApp(
        title: 'Shopping App',
        theme: ThemeData(
            fontFamily: 'Lato',
            //color scheme is based on seed Color, which will be base color of app
            colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromRGBO(254, 206, 1, 1),
              primary: const Color.fromRGBO(254, 206, 1, 1),
            ),
            appBarTheme: const AppBarTheme(
                titleTextStyle: TextStyle(
              fontSize: 20,
              color: Colors.black,
            )),
            inputDecorationTheme: const InputDecorationTheme(
                hintStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                prefixIconColor: Color.fromRGBO(119, 119, 119, 1)),
            textTheme: const TextTheme(
                titleLarge: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 35,
                ),
                titleMedium: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
                bodySmall:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0)),
            useMaterial3: true),
        home: const HomePage(),
      ),
    );
  }
}

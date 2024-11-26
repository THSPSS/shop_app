import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
            Text('Shoes', style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 35.0
              )),
            Text('Collection', style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 35.0
              )),
            TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.only(topRight: Radius.circular(10.0) , bottomRight: Radius.circular(10.0)),)
                      ,hintText: 'Search',
                      prefixIcon: Icon(Icons.search)
                  ),
                ),
      ],)
    );
  }
}
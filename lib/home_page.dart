import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 140.0,
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Shoes\nCollection',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 35.0)),
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black54),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30.0),
                              bottomLeft: Radius.circular(30.0)),
                        ),
                        hintText: 'Search',
                        prefixIcon: Icon(Icons.search)),
                  ),
                ),
              ],
            ),
          ),
          //categories
          //using listviewBuilder? or just using for loop?
          Flexible(
            child: SizedBox(
              height: 60.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (BuildContext context, int i) {
                  return TextButton(onPressed: null, child: Text('button $i'));
                },
              ),
            ),
          )
        ],
      ),
    ));
  }
}

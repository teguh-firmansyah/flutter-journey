import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Container> myContainer = [
      Container(width: 200, height: 200, color: Colors.yellow),
      Container(width: 200, height: 200, color: Colors.blue),
      Container(width: 200, height: 200, color: Colors.pink),
      Container(width: 200, height: 200, color: Colors.black),
    ];

    return MaterialApp(
      title: 'Flutter App',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Hi Teguh!",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.blue,
          centerTitle: true,
        ),
        body: Container(
          width: 300,
          height: 300,
          color: Colors.redAccent,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: myContainer,
          ),
        ),
      ),
    );
  }
}

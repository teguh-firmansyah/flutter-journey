import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Color> myColor = [
      Colors.yellow,
      Colors.red,
      Colors.green,
      Colors.blue,
      Colors.orange,
      Colors.purple,
    ];

    final List<Widget> myList = List.generate(
      100,
      (index) => Text(
        "${index + 1}",
        style: TextStyle(fontSize: 20 + double.parse(index.toString())),
      ),
    );

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
          child: ListView(children: myList),
        ),
      ),
    );
  }
}

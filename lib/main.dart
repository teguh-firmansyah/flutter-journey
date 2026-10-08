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
          child: ListView.builder(
            itemCount: myColor.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(width: 200, height: 200, color: myColor[index]);
            },
          ),
        ),
      ),
    );
  }
}

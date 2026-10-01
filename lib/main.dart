import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            "Hi Teguh!!",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: Center(
          child: Text(
            "Perkenalkan nama saya Teguh Firmansyah, saya sekolah di SMK Assaalaam Bandung, saya hobi mendaki, berlari, bersepedah, badminton, berenang, dan membaca buku, cita-cita saya ingin menjadi seorang softwaree engineer dan cyber security.",
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.justify,
            style: TextStyle(
              backgroundColor: Colors.blue,
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.bold,
              fontFamily: 'Roboto',
              letterSpacing: 2,
              decorationStyle: TextDecorationStyle.dashed,
              decoration: TextDecoration.underline,
              decorationColor: Colors.red,
              decorationThickness: 3,
            ),
          ),
        ),
      ),
    );
  }
}

class HelloWidget extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Hello Flutter",
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.amber,
        ),
      ),
    );
  }
}

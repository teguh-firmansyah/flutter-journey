// import 'package:example/routes/app_route.dart';
import 'package:example/image/ImageWidget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     title: 'Flutter App',
  //     debugShowCheckedModeBanner: false,
  //     initialRoute: '/',
  //     routes: AppRoute.routes,
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Image Widget",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.blue,
          centerTitle: true,
        ),
        body: ImageWidget(),
      ),
    );
  }
}

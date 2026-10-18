// import 'package:example/routes/app_route.dart';
import 'package:example/list_grid_singlechild/list_view/ListTile.dart';
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
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "WhatsApp",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Row(
                children: [
                  Icon(Icons.camera_alt, size: 30, color: Colors.white),
                  SizedBox(width: 15),
                  Icon(Icons.more_vert, size: 30, color: Colors.white),
                ],
              ),
            ],
          ),
          backgroundColor: Colors.black,
        ),
        body: ListTileWidget(),
      ),
    );
  }
}

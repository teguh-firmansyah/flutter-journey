import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Page')),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/about');
              },
              child: Text('Masuk Profile'),
            ),
            Divider(),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/list-basic');
              },
              child: Text('Masuk List'),
            ),
            Divider(),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/container');
              },
              child: Text('Masuk Container'),
            ),
            Divider(),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/grid-basic');
              },
              child: Text('Masuk Grid'),
            ),
            Divider(),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/single-child');
              },
              child: Text('Masuk Single Child'),
            ),
            Divider(),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/column');
              },
              child: Text('Masuk Column'),
            ),
            Divider(),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/row');
              },
              child: Text('Masuk Row'),
            ),
            Divider(),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/expanded');
              },
              child: Text('Masuk Expanded'),
            ),
            Divider(),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/sized');
              },
              child: Text('Masuk Sized'),
            ),
            Divider(),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/stack');
              },
              child: Text('Masuk Stack'),
            ),
            Divider(),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/form');
              },
              child: Text('Masuk Form'),
            ),
          ],
        ),
      ),
    );
  }
}

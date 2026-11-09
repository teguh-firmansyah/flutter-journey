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
            SizedBox(height: 5),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/list-basic');
              },
              child: Text('Masuk List'),
            ),
            SizedBox(height: 5),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/container');
              },
              child: Text('Masuk Container'),
            ),
            SizedBox(height: 5),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/grid-basic');
              },
              child: Text('Masuk Grid'),
            ),
            SizedBox(height: 5),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/single-child');
              },
              child: Text('Masuk Single Child'),
            ),
            SizedBox(height: 5),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/column');
              },
              child: Text('Masuk Column'),
            ),
            SizedBox(height: 5),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/row');
              },
              child: Text('Masuk Row'),
            ),
            SizedBox(height: 5),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/expanded');
              },
              child: Text('Masuk Expanded'),
            ),
            SizedBox(height: 5),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/sized');
              },
              child: Text('Masuk Sized'),
            ),
            SizedBox(height: 5),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/stack');
              },
              child: Text('Masuk Stack'),
            ),
            SizedBox(height: 5),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/form');
              },
              child: Text('Masuk Form'),
            ),
            SizedBox(height: 5),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/input-page');
              },
              child: Text('Masuk Input'),
            ),
            SizedBox(height: 5),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/formulir');
              },
              child: Text('Masuk Formulir'),
            ),
          ],
        ),
      ),
    );
  }
}

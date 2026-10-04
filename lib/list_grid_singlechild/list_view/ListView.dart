import 'package:flutter/material.dart';

class ListViewWidget extends StatelessWidget {
  const ListViewWidget({super.key});

  final List<String> produk = const [
    'Laptop',
    'Keyboard',
    'Mouse',
    'Monitor',
    'Headset',
    'Webcam',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Daftar Produk')),
      body: Container(
        height: 100,
        width: double.infinity,
        color: Colors.blue,
        child: SizedBox(
          height: 120,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.all(12),
            children: const [
              Card(
                color: Colors.amber,
                child: SizedBox(
                  width: 150,
                  child: Center(
                    child: Text(
                      'Kategori 1',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              Card(
                color: Colors.red,
                child: SizedBox(
                  width: 150,
                  child: Center(
                    child: Text(
                      'Kategori 2',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              Card(
                color: Colors.green,
                child: SizedBox(
                  width: 150,
                  child: Center(
                    child: Text(
                      'Kategori 3',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              Card(
                color: Colors.black,
                child: SizedBox(
                  width: 150,
                  child: Center(
                    child: Text(
                      'Kategori 4',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              Card(
                color: Colors.pink,
                child: SizedBox(
                  width: 150,
                  child: Center(
                    child: Text(
                      'Kategori 5',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

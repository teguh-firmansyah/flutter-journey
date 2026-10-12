import 'package:flutter/material.dart';

class ArticleDetailScreen extends StatelessWidget {
  final Map<String, String> data;
  const ArticleDetailScreen({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Detail Artikel'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              data['title']!,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Image.network(data['image']!, height: 200),
            const SizedBox(height: 20),
            Text(data['description']!, style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}

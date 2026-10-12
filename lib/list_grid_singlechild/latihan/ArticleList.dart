import 'package:example/list_grid_singlechild/latihan/DetailScreen.dart';
import 'package:flutter/material.dart';

class ArticleListScreen extends StatelessWidget {
  const ArticleListScreen({super.key});

  final List<Map<String, String>> articles = const [
    {
      'title': 'Pengertian Flutter',
      'description': 'Belajar Flutter Dasar',
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRsbz4_2fp-bENwkckYc5FJClxTclMXRLhUiiM51qhrRQ&s=10',
    },
    {
      'title': 'Instalasi FLutter',
      'description': 'Cara Menginstal FLutter',
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRsbz4_2fp-bENwkckYc5FJClxTclMXRLhUiiM51qhrRQ&s=10',
    },
    {
      'title': 'Stateles Dan StateFull Widget',
      'description': 'Perbedaan Stateles Dan StateFull Widget',
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRsbz4_2fp-bENwkckYc5FJClxTclMXRLhUiiM51qhrRQ&s=10',
    },
    {
      'title': 'Visible Dan Invisible Widget',
      'description': 'Perbedaan Visible dan Invisible Widget',
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRsbz4_2fp-bENwkckYc5FJClxTclMXRLhUiiM51qhrRQ&s=10',
    },
    {
      'title': 'Text Widget',
      'description': 'Mempelaji Text Widget',
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRsbz4_2fp-bENwkckYc5FJClxTclMXRLhUiiM51qhrRQ&s=10',
    },
    {
      'title': 'Column, Row, Stack',
      'description': 'Mempelajari Widget Column, Row, dan Widget',
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRsbz4_2fp-bENwkckYc5FJClxTclMXRLhUiiM51qhrRQ&s=10',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: articles.length,
      itemBuilder: (context, index) {
        final article = articles[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => ArticleDetailScreen(data: article),
              ),
            );
          },
          child: Container(
            margin: const EdgeInsets.all(10),
            height: 120,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: const [BoxShadow(color: Colors.black, blurRadius: 6)],
            ),
            child: Row(
              children: [
                Container(
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      bottomLeft: Radius.circular(15),
                    ),
                    image: DecorationImage(
                      image: NetworkImage(article['image']!),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          article['title']!,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          article['description']!,
                          style: const TextStyle(fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

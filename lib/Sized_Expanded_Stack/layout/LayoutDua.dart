import 'package:flutter/material.dart';

class LayoutDua extends StatelessWidget {
  const LayoutDua({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Container(
            width: 180,
            height: 180,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(Icons.image, size: 60, color: Colors.grey),
          ),
          Positioned(
            top: 8,
            left: 8,
            child: Container(
              padding: EdgeInsets.all(8),
              color: Colors.red,
              child: Text("-20%"),
            ),
          ),
          Positioned(bottom: 8, right: 8, child: Icon(Icons.favorite_border)),
        ],
      ),
    );
  }
}

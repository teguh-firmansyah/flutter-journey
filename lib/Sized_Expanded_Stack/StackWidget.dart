import 'package:flutter/material.dart';

class StackWidget extends StatelessWidget {
  const StackWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(width: 200, height: 200, color: Colors.red),
        Positioned(
          bottom: 20,
          right: 20,
          child: Icon(Icons.favorite, color: Colors.white),
        ),
        Positioned(top: 5, left: 10, child: Text("Label")),
        Positioned(
          right: 25,
          top: 25,
          left: 25,
          child: Container(width: 100, height: 100, color: Colors.yellow),
        ),
      ],
    );
  }
}

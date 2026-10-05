import 'package:flutter/material.dart';

class ColumnWidget extends StatelessWidget {
  const ColumnWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(width: 100, height: 50, color: Colors.yellow),
        Container(width: 200, height: 50, color: Colors.red),
        Container(width: 150, height: 50, color: Colors.green),
        Container(width: 50, height: 50, color: Colors.orange),
      ],
    );
  }
}

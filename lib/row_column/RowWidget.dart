import 'package:flutter/material.dart';

class RowWidget extends StatelessWidget {
  const RowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(height: 100, width: 50, color: Colors.yellow),
        Container(height: 200, width: 50, color: Colors.red),
        Container(height: 150, width: 50, color: Colors.green),
        Container(height: 50, width: 50, color: Colors.orange),
      ],
    );
  }
}

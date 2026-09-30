import 'package:flutter/material.dart';

class ColumnWidget extends StatelessWidget {
  const ColumnWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text("Column 1"),
        Text("Column 2"),
        Text("Column 3"),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [Text("Row 1"), Text("Row 2")],
        ),
      ],
    );
  }
}

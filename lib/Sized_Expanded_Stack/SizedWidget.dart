import 'package:flutter/material.dart';

class SizedWidget extends StatelessWidget {
  const SizedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [Text("Hallo Teguh"), SizedBox(height: 5), Text("Hallo Bob")],
    );
  }
}

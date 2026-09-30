import 'package:flutter/material.dart';

class CardSekolah extends StatelessWidget {
  const CardSekolah({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 200,
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(15),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.lightGreen,
        border: BoxBorder.all(color: Colors.green, width: 2),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        height: 60,
        width: 200,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.yellow,
          border: BoxBorder.all(
            color: const Color.fromARGB(255, 211, 191, 9),
            width: 2,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          "Kelas XII RPL",
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class LatihanSatu extends StatelessWidget {
  const LatihanSatu({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: double.infinity,
        height: 60,
        color: Colors.white,
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                width: 50,
                height: double.infinity,
                color: Colors.lightBlue,
                child: Center(child: Text("Pemasukan")),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              flex: 1,
              child: Container(
                width: 50,
                height: double.infinity,
                color: Colors.green,
                child: Center(child: Text("Pengeluaran")),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              flex: 1,
              child: Container(
                width: 50,
                height: double.infinity,
                color: Colors.yellow,
                child: Center(child: Text("Saldo")),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

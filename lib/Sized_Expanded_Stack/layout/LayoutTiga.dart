import 'package:flutter/material.dart';

class LayoutTiga extends StatelessWidget {
  const LayoutTiga({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(height: 140, color: Colors.amber),
            Positioned(
              bottom: -30,
              left: 20,
              child: SizedBox(
                width: 80,
                height: 80,
                child: CircleAvatar(
                  backgroundColor: Colors.blue,
                  backgroundImage: NetworkImage(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTlb6dhxD9jUBCsMH2x8d0IiJdihcSJK3pMLM9q0kiBFQ&s=10",
                  ),
                  radius: 30,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 40),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text("Teguh Firmansyah"), Text("XII RPL 1")],
                ),
              ),
            ],
          ),
        ),
        ElevatedButton(
          onPressed: () {},
          child: Text("Follow", style: TextStyle(color: Colors.red)),
        ),
      ],
    );
  }
}

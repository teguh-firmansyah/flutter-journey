import 'package:flutter/material.dart';

class ContainerSatu extends StatelessWidget {
  const ContainerSatu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      alignment: Alignment.topCenter,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        image: DecorationImage(
          image: NetworkImage(
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRUTGcCW5sDsK2J4iS3H91G62kA_Yr4kdRpSxHAFAKDtQ&s=10",
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Text(
        "Lorem Ipsum dolor sit amet",
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}

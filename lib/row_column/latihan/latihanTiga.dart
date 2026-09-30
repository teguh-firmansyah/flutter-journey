import 'package:flutter/material.dart';

class LatihanTiga extends StatelessWidget {
  const LatihanTiga({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          border: BoxBorder.all(
            color: const Color.fromARGB(255, 49, 14, 206),
            width: 2,
          ),
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
            image: NetworkImage(
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRiAzrJfL-uMz1PuQWTvfwOVHKtB4X2QoGODJgS67sJBg&s=10",
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                border: BoxBorder.all(
                  color: const Color.fromARGB(255, 187, 187, 173),
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image: NetworkImage(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTBvq26wOg0Zi4H-gLYQKJsHN1IhEoteb3j2cn9u__ifA&s=10",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                border: BoxBorder.all(
                  color: const Color.fromARGB(255, 187, 187, 173),
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image: NetworkImage(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTBvq26wOg0Zi4H-gLYQKJsHN1IhEoteb3j2cn9u__ifA&s=10",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                border: BoxBorder.all(
                  color: const Color.fromARGB(255, 187, 187, 173),
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image: NetworkImage(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTBvq26wOg0Zi4H-gLYQKJsHN1IhEoteb3j2cn9u__ifA&s=10",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

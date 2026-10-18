import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 250,
        height: 400,
        color: Colors.amber,
        // child: Image(
        //   image: AssetImage("images/Auth.png"),
        //   image: NetworkImage(
        //     "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRrU-0QSwPfUMVR0LsiKRXw_B8W4DxHbn31fzb6rxee5A&s=10",
        //   ),
        // ),
        child: Image.asset("images/Auth.png", fit: BoxFit.fill),
      ),
    );
  }
}

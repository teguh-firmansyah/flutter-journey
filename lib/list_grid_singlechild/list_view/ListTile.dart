import 'package:flutter/material.dart';

class ListTileWidget extends StatelessWidget {
  const ListTileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          padding: EdgeInsets.only(left: 20),
          width: double.infinity,
          height: 45,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color.fromARGB(255, 22, 22, 22),
          ),
          child: Row(
            children: [
              Icon(Icons.search, size: 25, color: Colors.grey),
              SizedBox(width: 10),
              Text(
                "Tanya Meta AI atau cari",
                style: TextStyle(color: Colors.grey, fontSize: 13),
              ),
            ],
          ),
        ),
        ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRz3bTY11EaRwzgva4Uz_toChrp-ZA93jl0AcPn-irENw&s=10",
            ),
          ),
          title: Text(
            "XII RPL 1",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            "Bu herna: Assalaamualaikum anak anak ada pengumunan untulk besok masuk pagi",
            style: TextStyle(color: Colors.grey),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          trailing: Column(
            children: [
              Text("17.43", style: TextStyle(color: Colors.grey)),
              SizedBox(height: 5),
              Icon(Icons.push_pin, color: Colors.grey),
            ],
          ),
        ),
        SizedBox(height: 5),
        ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRPxOTyYxwOLmKNvtDx3scr7IyeMsiEfOpnVrvSaVmPtg&s=10",
            ),
          ),
          title: Text(
            "CANTIKKUU (Love)",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            "IYAAAA SAYAANGGKUUU",
            style: TextStyle(color: Colors.grey),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          trailing: Column(
            children: [
              Text("17.43", style: TextStyle(color: Colors.grey)),
              SizedBox(height: 5),
              Icon(Icons.push_pin, color: Colors.grey),
            ],
          ),
        ),
        SizedBox(height: 5),
        ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQYwgGKT7e-DGfcIzYKOTyhlm5Vol2BIhYIBYrhVmIYtQ&s=10",
            ),
          ),
          title: Text(
            "twelvonee",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            "rehan: gasss",
            style: TextStyle(color: Colors.grey),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          trailing: Column(
            children: [
              Text("17.43", style: TextStyle(color: Colors.grey)),
              SizedBox(height: 5),
              Icon(Icons.push_pin, color: Colors.grey),
            ],
          ),
        ),
        SizedBox(height: 5),
      ],
    );
  }
}

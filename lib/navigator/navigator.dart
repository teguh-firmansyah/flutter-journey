import 'package:example/list_grid_singlechild/list_view/ListView.dart';
import 'package:flutter/material.dart';

class NavigatorWidget extends StatelessWidget {
  const NavigatorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return ListViewWidget();
                  },
                ),
              );
            },
            child: Text("List Basic"),
          ),
        ],
      ),
    );
  }
}

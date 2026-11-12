import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Page'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 1.5,
          children: [
            _buildMenuCard(
              context,
              title: 'Profile',
              icon: Icons.person,
              routeName: '/about',
              color: Colors.blue,
            ),
            _buildMenuCard(
              context,
              title: 'List',
              icon: Icons.list,
              routeName: '/list-basic',
              color: Colors.orange,
            ),
            _buildMenuCard(
              context,
              title: 'Container',
              icon: Icons.crop_square,
              routeName: '/container',
              color: Colors.purple,
            ),
            _buildMenuCard(
              context,
              title: 'Grid',
              icon: Icons.grid_view,
              routeName: '/grid-basic',
              color: Colors.green,
            ),
            _buildMenuCard(
              context,
              title: 'Single Child',
              icon: Icons.filter_1,
              routeName: '/single-child',
              color: Colors.teal,
            ),
            _buildMenuCard(
              context,
              title: 'Column',
              icon: Icons.view_column,
              routeName: '/column',
              color: Colors.indigo,
            ),
            _buildMenuCard(
              context,
              title: 'Row',
              icon: Icons.view_stream,
              routeName: '/row',
              color: Colors.amber,
            ),
            _buildMenuCard(
              context,
              title: 'Expanded',
              icon: Icons.open_in_full,
              routeName: '/expanded',
              color: Colors.deepOrange,
            ),
            _buildMenuCard(
              context,
              title: 'Sized Box',
              icon: Icons.aspect_ratio,
              routeName: '/sized',
              color: Colors.brown,
            ),
            _buildMenuCard(
              context,
              title: 'Stack',
              icon: Icons.layers,
              routeName: '/stack',
              color: Colors.pink,
            ),
            _buildMenuCard(
              context,
              title: 'Form',
              icon: Icons.edit_note,
              routeName: '/form',
              color: Colors.cyan,
            ),
            _buildMenuCard(
              context,
              title: 'Input',
              icon: Icons.input,
              routeName: '/input-page',
              color: Colors.deepPurple,
            ),
            _buildMenuCard(
              context,
              title: 'Formulir',
              icon: Icons.assignment,
              routeName: '/formulir',
              color: Colors.red,
            ),
            _buildMenuCard(
              context,
              title: 'Album',
              icon: Icons.album,
              routeName: '/album',
              color: Colors.black,
            ),
            _buildMenuCard(
              context,
              title: 'Post',
              icon: Icons.api,
              routeName: '/fetch',
              color: Colors.red,
            ),
            _buildMenuCard(
              context,
              title: 'Comment',
              icon: Icons.comment,
              routeName: '/comment',
              color: Colors.green,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuCard(
    BuildContext context, {
    required String title,
    required IconData icon,
    required String routeName,
    required Color color,
  }) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, routeName);
        },
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 36, color: color),
              const SizedBox(height: 8),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../models/user_model.dart';
import '../../services/auth_service.dart';
import 'login_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _auth = AuthService();
  late Future<UserModel> _futureUser;

  @override
  void initState() {
    super.initState();
    _futureUser = _auth.getUser();
  }

  Future<void> _logout() async {
    await _auth.logout();
    if (!mounted) return;
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => const LoginPage()),
      (_) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(onPressed: _logout, icon: const Icon(Icons.logout)),
        ],
      ),
      body: Center(
        child: FutureBuilder<UserModel>(
          future: _futureUser,
          builder: (context, snap) {
            if (snap.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }
            if (snap.hasError) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(snap.error.toString()),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: _logout,
                    child: const Text('Kembali ke Login'),
                  ),
                ],
              );
            }
            final user = snap.data!;
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Halo, ${user.name}',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                Text(user.email),
              ],
            );
          },
        ),
      ),
    );
  }
}

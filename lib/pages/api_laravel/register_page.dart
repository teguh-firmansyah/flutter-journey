import 'package:flutter/material.dart';

import '../../services/api_exception.dart';
import '../../services/auth_service.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _nameC = TextEditingController();
  final _emailC = TextEditingController();
  final _passC = TextEditingController();
  final _auth = AuthService();
  bool _loading = false;

  void _showMessage(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  Future<void> _register() async {
    if (_nameC.text.trim().isEmpty ||
        _emailC.text.trim().isEmpty ||
        _passC.text.length < 8) {
      _showMessage('Lengkapi data, password minimal 8 karakter');
      return;
    }

    setState(() => _loading = true);
    try {
      await _auth.register(
        name: _nameC.text.trim(),
        email: _emailC.text.trim(),
        password: _passC.text,
      );
      if (!mounted) return;
      _showMessage('Register berhasil, silakan login');
      Navigator.pop(context); // kembali ke halaman login
    } on ApiException catch (e) {
      if (mounted) _showMessage(e.message);
    } catch (_) {
      if (mounted) _showMessage('Terjadi kesalahan tak terduga');
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  @override
  void dispose() {
    _nameC.dispose();
    _emailC.dispose();
    _passC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Register')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _nameC,
              decoration: const InputDecoration(labelText: 'Nama'),
            ),
            TextField(
              controller: _emailC,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _passC,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password (min 8 karakter)',
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _loading ? null : _register,
                child: _loading
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Text('Register'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

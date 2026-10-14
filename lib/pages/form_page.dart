import 'package:flutter/material.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();

  var _outputName = '';

  @override
  void dispose() {
    // Menghapus inputan yang sudah di isi
    _nameController.dispose();
    // Mengeksekusi method dispose
    super.dispose();
  }

  void _submitForm() {
    setState(() {
      _outputName = _nameController.text;
    });
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('Proses Data')));

    _clearInput();
  }

  void _clearInput() {
    _nameController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Formulir Biodata',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Nama',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Nama Tidak Boleh Kosong";
                  }
                  return null;
                },
              ),
            ),
            SizedBox(height: 10),
            OutlinedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _submitForm();
                }
              },
              style: ElevatedButton.styleFrom(minimumSize: Size(150, 45)),
              child: Text("Simpan"),
            ),
            SizedBox(height: 10),
            Text('Username Kamu: ${_outputName.isEmpty ? " -" : _outputName}'),
          ],
        ),
      ),
    );
  }
}

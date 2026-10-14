import 'package:flutter/material.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _tanggalLahirController = TextEditingController();

  var _outputName = '';
  DateTime? _outputDate;

  DateTime? _selectedDate;

  @override
  void dispose() {
    // Menghapus inputan yang sudah di isi
    _nameController.dispose();
    _tanggalLahirController.dispose();
    // Mengeksekusi method dispose
    super.dispose();
  }

  Future<void> _selectDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
      helpText: 'Pilih Tanggal Lahir',
      cancelText: 'Batal',
      confirmText: 'Simpan',
    );

    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
        _tanggalLahirController.text = _formatTanggal(pickedDate);
      });
    }
  }

  String _formatTanggal(DateTime tanggal) {
    final hari = tanggal.day.toString().padLeft(2, '0');
    final bulan = tanggal.month.toString().padLeft(2, '0');
    final tahun = tanggal.year.toString();

    return '$hari/$bulan/$tahun';
  }

  void _submitForm() {
    setState(() {
      _outputName = _nameController.text;
      _outputDate = _selectedDate;
    });
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('Data berhasil disimpan')));

    _clearInput();
  }

  void _clearInput() {
    _nameController.clear();
    _tanggalLahirController.clear();
    _selectedDate = null;
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
        child: SingleChildScrollView(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Nama',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Nama tidak boleh kosong";
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _tanggalLahirController,
                readOnly: true,
                onTap: _selectDate,
                decoration: InputDecoration(
                  labelText: 'Tanggal Lahir',
                  hintText: 'Pilih tanggal',
                  prefixIcon: Icon(Icons.calendar_today),
                  border: OutlineInputBorder(),
                  suffixIcon: _selectedDate == null
                      ? null
                      : IconButton(
                          onPressed: () {
                            setState(() {
                              _selectedDate = null;
                              _tanggalLahirController.clear();
                            });
                          },
                          icon: Icon(Icons.clear),
                        ),
                ),
                validator: (value) {
                  if (_selectedDate == null) {
                    return 'Tanggal tidak boleh kosong';
                  }
                  return null;
                },
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
              Text(
                'Username Kamu: ${_outputName.isEmpty ? " -" : _outputName}',
              ),
              Text(
                'Tanggal Lahir: ${_outputDate == null ? '-' : _formatTanggal(_outputDate!)}',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

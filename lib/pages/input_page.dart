import 'package:flutter/material.dart';
import 'package:example/helpers/size_helper.dart';
import 'package:example/pages/output_page.dart';
import 'package:intl/intl.dart';

class BelajarForm extends StatefulWidget {
  const new({super.key});

  @override
  State<BelajarForm> createState() => _BelajarFormState();
}

class _BelajarFormState extends State<BelajarForm> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController namaController = TextEditingController();
  TextEditingController tglLahirController = TextEditingController();

  String _jk = "";
  String? _jkError;
  String _pilihAgama = "";

  final List<String> agama = [
    "Islam",
    "Kristen",
    "Hindu",
    "Budha",
    "Konghucu",
    "Katholik",
  ];

  @override
  void initState() {
    tglLahirController.text = '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        color: Colors.blueGrey,
        child: Center(
          child: SingleChildScrollView(
            child: Card(
              elevation: 4,
              margin: const EdgeInsets.all(16),
              shape: RoundedRectangleBorder(
                side: const BorderSide(color: Colors.black),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "Formulir Biodata",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 18),

                      TextFormField(
                        controller: namaController,
                        decoration: InputDecoration(
                          hintText: "Nama Lengkap",
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Masukkan Nama';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 18),

                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Jenis Kelamin",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Radio<String>(
                            value: "Laki-laki",
                            groupValue: _jk,
                            onChanged: (value) {
                              setState(() {
                                _jk = value!;
                                _jkError = null;
                              });
                            },
                          ),
                          Text("Laki-laki"),
                          Radio<String>(
                            value: "Perempuan",
                            groupValue: _jk,
                            onChanged: (value) {
                              setState(() {
                                _jk = value!;
                                _jkError = null;
                              });
                            },
                          ),
                          Text("Perempuan"),
                        ],
                      ),
                      if (_jkError != null)
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            _jkError!,
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      const SizedBox(height: 18),

                      TextFormField(
                        controller: tglLahirController,
                        decoration: InputDecoration(
                          hintText: "Tanggal Lahir",
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Masukkan Tanggal Lahir";
                          }
                          return null;
                        },
                        readOnly: true,
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1900),
                            lastDate: DateTime(2100),
                          );
                          if (pickedDate != null) {
                            setState(() {
                              tglLahirController.text = DateFormat('yyyy-MM-DD')
                                  .format(pickedDate);
                            });
                          }
                        },
                      ),
                      const SizedBox(height: 18),

                      DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          labelText: "Pilih Agama",
                          border: OutlineInputBorder(),
                        ),
                        items: agama
                            .map(
                              (item) => DropdownMenuItem(
                                value: item,
                                child: Text(item),
                              ),
                            )
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            _pilihAgama = value!;
                          });
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Pilih Agama";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 24),

                      SizedBox(
                        width: displayWidth(context) * 0.8,
                        height: displayHeight(context) * 0.075,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                              side: BorderSide(color: Colors.black),
                            ),
                          ),
                          child: Text(
                            "Simpan",
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: _submit,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _submit() {
    final isValid = _formKey.currentState!.validate();
    if (_jk.isEmpty) {
      setState(() => _jkError = 'Pilih Jenis Kelamin');
    }

    if (!isValid || _jk.isEmpty) {
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OutputFormScreen(
          nama: namaController.text,
          jk: _jk,
          tglLahir: tglLahirController.text,
          agama: _pilihAgama,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:example/helpers/size_helper.dart';
import 'package:example/pages/formulir_output.dart';
import 'package:intl/intl.dart';

class FormulirPage extends StatefulWidget {
  const FormulirPage({super.key});

  @override
  State<FormulirPage> createState() => _FormulirPageState();
}

class _FormulirPageState extends State<FormulirPage> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController namaController = TextEditingController();
  TextEditingController teleponController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController tglPendaftaranController = TextEditingController();

  String? _pilihKelas;
  final List<String> listKelas = [
    "X RPL",
    "X TKR",
    "X TSM",
    "XI RPL",
    "XI TKR",
    "XI TSM",
    "XII RPL",
    "XII TKR",
    "XII TSM",
  ];

  final List<String> listEskul = [
    "Pramuka",
    "Paskibra",
    "Futsal",
    "Basket",
    "PMR",
  ];
  final List<String> selectedEskul = [];
  String? _eskulError;

  @override
  void initState() {
    tglPendaftaranController.text = '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Formulir Pendaftaran Eskul"),
        backgroundColor: Colors.blueGrey,
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          color: Colors.blueGrey[50],
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
                        const Text(
                          "Pendaftaran Ekstrakurikuler",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 18),

                        TextFormField(
                          controller: namaController,
                          decoration: const InputDecoration(
                            hintText: "Nama Lengkap",
                            labelText: "Nama Lengkap",
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Masukkan Nama Lengkap';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 18),

                        TextFormField(
                          controller: teleponController,
                          keyboardType: TextInputType.phone,
                          decoration: const InputDecoration(
                            hintText: "No Telepon",
                            labelText: "No Telepon",
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Masukkan No Telepon';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 18),

                        TextFormField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            hintText: "Email",
                            labelText: "Email",
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Masukkan Email';
                            }
                            if (!value.contains('@')) {
                              return 'Format email tidak valid (harus ada @)';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 18),

                        DropdownButtonFormField<String>(
                          decoration: const InputDecoration(
                            labelText: "Pilih Kelas",
                            border: OutlineInputBorder(),
                          ),
                          initialValue: _pilihKelas,
                          items: listKelas
                              .map(
                                (item) => DropdownMenuItem(
                                  value: item,
                                  child: Text(item),
                                ),
                              )
                              .toList(),
                          onChanged: (value) {
                            setState(() {
                              _pilihKelas = value;
                            });
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Pilih Kelas terlebih dahulu";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 18),

                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Pilih Eskul (Minimal 1, Maksimal 2)",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        ...listEskul.map((eskul) {
                          return CheckboxListTile(
                            title: Text(eskul),
                            value: selectedEskul.contains(eskul),
                            controlAffinity: ListTileControlAffinity.leading,
                            onChanged: (bool? checked) {
                              setState(() {
                                if (checked == true) {
                                  if (selectedEskul.length < 2) {
                                    selectedEskul.add(eskul);
                                    _eskulError = null;
                                  } else {
                                    _eskulError =
                                        'Maksimal hanya dapat memilih 2 eskul';
                                  }
                                } else {
                                  selectedEskul.remove(eskul);
                                  if (selectedEskul.isNotEmpty) {
                                    _eskulError = null;
                                  }
                                }
                              });
                            },
                          );
                        }),

                        if (_eskulError != null)
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0, top: 4.0),
                            child: Text(
                              _eskulError!,
                              style: const TextStyle(
                                color: Colors.red,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        const SizedBox(height: 18),

                        TextFormField(
                          controller: tglPendaftaranController,
                          decoration: const InputDecoration(
                            hintText: "Tanggal Pendaftaran",
                            labelText: "Tanggal Pendaftaran",
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Masukkan Tanggal Pendaftaran";
                            }
                            return null;
                          },
                          readOnly: true,
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2023),
                              lastDate: DateTime(2100),
                            );
                            if (pickedDate != null) {
                              setState(() {
                                tglPendaftaranController.text = DateFormat(
                                  'yyyy-MM-dd',
                                ).format(pickedDate);
                              });
                            }
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
                                side: const BorderSide(color: Colors.black),
                              ),
                            ),
                            onPressed: _submit,
                            child: const Text(
                              "Simpan",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
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
      ),
    );
  }

  void _submit() {
    final isValid = _formKey.currentState!.validate();

    if (selectedEskul.isEmpty) {
      setState(() {
        _eskulError = 'Pilih minimal 1 ekstrakurikuler';
      });
    } else if (selectedEskul.length > 2) {
      setState(() {
        _eskulError = 'Maksimal hanya dapat memilih 2 ekstrakurikuler';
      });
    } else {
      setState(() {
        _eskulError = null;
      });
    }

    if (!isValid || selectedEskul.isEmpty || selectedEskul.length > 2) {
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OutputFormScreen(
          nama: namaController.text,
          telepon: teleponController.text,
          email: emailController.text,
          kelas: _pilihKelas ?? '',
          eskul: selectedEskul.join(', '),
          tglPendaftaran: tglPendaftaranController.text,
        ),
      ),
    );
  }
}

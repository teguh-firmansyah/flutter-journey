import 'package:flutter/material.dart';

class FormulirPage extends StatefulWidget {
  const new({super.key});

  @override
  State<FormulirPage> createState() => _FormulirPageState();
}

class _FormulirPageState extends State<FormulirPage> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController namaController = TextEditingController();
  TextEditingController nomorTeleponController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController tanggalDaftarController = TextEditingController();

  String _kelas = "";
  String? _kelasError;
  String _pilihEskul = "";

  final List<String> kelas = [
    "X RPL 1",
    "X RPL 2",
    "X TSM 1",
    "X TSM 2",
    "X TKR 1",
    "X TKR 2",
    "XI RPL 1",
    "XI RPL 2",
    "XI TSM 1",
    "XI TSM 2",
    "XI TKR 1",
    "XI TKR 2",
    "XII RPL 1",
    "XII RPL 2",
    "XII RPL 3",
    "XII TSM",
    "XII TKR 1",
    "XII TKR 2",
  ];

  @override
  void initState() {
    tanggalDaftarController.text = '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Formulir Daftar Eskul",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: SafeArea(
        child: Container(width: double.infinity, color: Colors.blueGrey),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class OutputFormScreen extends StatelessWidget {
  final String nama;
  final String telepon;
  final String email;
  final String kelas;
  final String eskul;
  final String tglPendaftaran;

  const OutputFormScreen({
    super.key,
    required this.nama,
    required this.telepon,
    required this.email,
    required this.kelas,
    required this.eskul,
    required this.tglPendaftaran,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bukti Pendaftaran Eskul"),
        backgroundColor: Colors.blueGrey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: const BorderSide(color: Colors.black),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Data Berhasil Disimpan!",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
                const Divider(height: 24),
                Text(
                  "Nama Lengkap: $nama",
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 10),
                Text(
                  "No Telepon: $telepon",
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 10),
                Text("Email: $email", style: const TextStyle(fontSize: 16)),
                const SizedBox(height: 10),
                Text("Kelas: $kelas", style: const TextStyle(fontSize: 16)),
                const SizedBox(height: 10),
                Text(
                  "Pilihan Eskul: $eskul",
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 10),
                Text(
                  "Tanggal Pendaftaran: $tglPendaftaran",
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 24),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueGrey,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Kembali",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

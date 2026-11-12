import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../constants/api_constants.dart';
import '../models/comments.dart';

class CommentsService {
  Future<List<Comments>> fetchPosts() async {
    final url = Uri.parse('${ApiConstants.baseUrl}${ApiConstants.comment}');

    try {
      final response = await http.get(url).timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        final List data = jsonDecode(response.body);

        return data.map((e) => Comments.fromJson(e)).toList();
      } else {
        throw Exception('Gagal memuat data (kode: ${response.statusCode})');
      }
    } on TimeoutException {
      throw Exception('Koneksi terlalu lama. Coba lagi.');
    }
  }
}

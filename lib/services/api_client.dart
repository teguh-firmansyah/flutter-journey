import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'api_exception.dart';

class ApiClient {
  static const _tokenKey = 'access_token';

  Future<String?> _getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_tokenKey);
  }

  Future<void> _clearToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_tokenKey);
  }

  /// [method] = 'GET' | 'POST' | 'PUT' | 'DELETE'
  Future<Map<String, dynamic>> request(
    String method,
    String url, {
    Map<String, dynamic>? body,
  }) async {
    final token = await _getToken();
    final uri = Uri.parse(url);
    final headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    final encoded = body == null ? null : jsonEncode(body);

    final response = await _guard(switch (method) {
      'GET' => http.get(uri, headers: headers),
      'POST' => http.post(uri, headers: headers, body: encoded),
      'PUT' => http.put(uri, headers: headers, body: encoded),
      'DELETE' => http.delete(uri, headers: headers),
      _ => throw ArgumentError('Method tidak dikenal: $method'),
    });

    return _handle(response);
  }

  Future<Map<String, dynamic>> multipart(
    String url, {
    required Map<String, String> fields,
    XFile? file,
    String fileField = 'image',
  }) async {
    final token = await _getToken();

    final request = http.MultipartRequest('POST', Uri.parse(url))
      ..headers.addAll({
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      })
      ..fields.addAll(fields);

    if (file != null) {
      request.files.add(
        http.MultipartFile.fromBytes(
          fileField,
          await file.readAsBytes(),
          filename: file.name,
        ),
      );
    }

    final response = await _guard(
      request.send().then(http.Response.fromStream),
      timeout: const Duration(seconds: 30),
    );

    return _handle(response);
  }

  Future<http.Response> _guard(
    Future<http.Response> future, {
    Duration timeout = const Duration(seconds: 15),
  }) async {
    try {
      return await future.timeout(timeout);
    } on SocketException {
      throw ApiException('Tidak ada koneksi atau server tidak terjangkau');
    } on TimeoutException {
      throw ApiException('Koneksi timeout, coba lagi');
    } on http.ClientException {
      throw ApiException('Tidak bisa terhubung ke server');
    }
  }

  Future<Map<String, dynamic>> _handle(http.Response response) async {
    final data = _decode(response);

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return data;
    }

    switch (response.statusCode) {
      case 401:
        await _clearToken();
        throw ApiException('Sesi habis, silakan login lagi', 401);
      case 404:
        throw ApiException('Data tidak ditemukan', 404);
      case 413:
        throw ApiException('Ukuran file terlalu besar', 413);
      case 422:
        throw ApiException(_parseErrors(data), 422);
      default:
        throw ApiException(
          data['message']?.toString() ?? 'Terjadi kesalahan pada server',
          response.statusCode,
        );
    }
  }

  Map<String, dynamic> _decode(http.Response response) {
    if (response.body.isEmpty) return {};
    try {
      final data = jsonDecode(response.body);
      return data is Map<String, dynamic> ? data : {};
    } on FormatException {
      throw ApiException('Response server tidak valid', response.statusCode);
    }
  }

  String _parseErrors(Map<String, dynamic> body) {
    final source = body['errors'] is Map ? body['errors'] as Map : body;
    final messages = source.values
        .expand((e) => e is List ? e : [e])
        .map((e) => e.toString())
        .toList();
    return messages.isEmpty ? 'Data tidak valid' : messages.join('\n');
  }
}

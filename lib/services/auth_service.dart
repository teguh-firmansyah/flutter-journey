import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/api_constant.dart';
import '../models/user_model.dart';
import 'api_exception.dart';

class AuthService {
  static const _tokenKey = 'access_token';
  Map<String, String> get _headers => {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
  };

  Future<void> _saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_tokenKey, token);
  }

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_tokenKey);
  }

  Future<void> _clearToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_tokenKey);
  }

  Future<http.Response> _send(Future<http.Response> Function() request) async {
    try {
      return await request().timeout(const Duration(seconds: 15));
    } on SocketException {
      throw ApiException('Tidak ada koneksi atau server tidak terjangkau');
    } on TimeoutException {
      throw ApiException('Koneksi timeout, coba lagi');
    }
  }

  Map<String, dynamic> _decode(http.Response response) {
    try {
      final data = jsonDecode(response.body);
      return data is Map<String, dynamic> ? data : {};
    } on FormatException {
      throw ApiException('Response server tidak valid', response.statusCode);
    }
  }

  String _parseErrors(Map<String, dynamic> body, String fallback) {
    final source = body['errors'] is Map ? body['errors'] as Map : body;
    final messages = source.values
        .expand((e) => e is List ? e : [e])
        .map((e) => e.toString())
        .toList();
    return messages.isEmpty ? fallback : messages.join('\n');
  }

  Future<UserModel> register({
    required String name,
    required String email,
    required String password,
  }) async {
    final response = await _send(
      () => http.post(
        Uri.parse(ApiConstant.register),
        headers: _headers,
        body: jsonEncode({'name': name, 'email': email, 'password': password}),
      ),
    );

    final body = _decode(response);

    if (body['data'] != null) {
      return UserModel.fromJson(body['data']);
    }
    throw ApiException(
      _parseErrors(body, 'Register gagal'),
      response.statusCode,
    );
  }

  Future<void> login({required String email, required String password}) async {
    final response = await _send(
      () => http.post(
        Uri.parse(ApiConstant.login),
        headers: _headers,
        body: jsonEncode({'email': email, 'password': password}),
      ),
    );

    final body = _decode(response);

    if (response.statusCode == 200 && body['access_token'] != null) {
      await _saveToken(body['access_token']);
      return;
    }
    throw ApiException(body['message'] ?? 'Login gagal', response.statusCode);
  }

  Future<UserModel> getUser() async {
    final token = await getToken();

    final response = await _send(
      () => http.get(
        Uri.parse(ApiConstant.user),
        headers: {..._headers, 'Authorization': 'Bearer $token'},
      ),
    );

    if (response.statusCode == 401) {
      await _clearToken();
      throw ApiException('Sesi habis, silakan login lagi', 401);
    }

    if (response.statusCode == 200) {
      return UserModel.fromJson(_decode(response));
    }
    throw ApiException('Gagal mengambil data user', response.statusCode);
  }

  Future<void> logout() async {
    final token = await getToken();
    try {
      await _send(
        () => http.post(
          Uri.parse(ApiConstant.logout),
          headers: {..._headers, 'Authorization': 'Bearer $token'},
        ),
      );
    } on ApiException {
      // Abaikan error jaringan, token lokal tetap dihapus
    } finally {
      await _clearToken();
    }
  }
}

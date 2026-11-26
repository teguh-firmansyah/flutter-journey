import 'package:flutter/foundation.dart' show kIsWeb;

class ApiConstant {
  // Android emulator : 10.0.2.2
  // iOS simulator    : 127.0.0.1
  // HP asli          : IP laptop kamu (contoh 192.168.1.10)
  // Flutter Web      : localhost
  static const String baseUrl = kIsWeb
      ? 'http://localhost:8000/api'
      : 'http://10.0.2.2:8000/api';

  static const String register = '$baseUrl/register';
  static const String login = '$baseUrl/login';
  static const String logout = '$baseUrl/logout';
  static const String user = '$baseUrl/user';

  static const String articles = '$baseUrl/articles';
}

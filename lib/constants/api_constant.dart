import 'package:flutter/foundation.dart' show kIsWeb;

class ApiConstant {
  static const String baseUrl = kIsWeb
      ? 'http://localhost:8000/api'
      : 'http://10.0.2.2:8000/api';

  static String get serverUrl => baseUrl.replaceFirst('/api', '');

  static const String register = '$baseUrl/register';
  static const String login = '$baseUrl/login';
  static const String logout = '$baseUrl/logout';
  static const String user = '$baseUrl/user';

  static const String articles = '$baseUrl/articles';

  static String imageUrl(String? path) {
    if (path == null || path.isEmpty) {
      return '';
    }

    return '$serverUrl/storage/$path';
  }
}

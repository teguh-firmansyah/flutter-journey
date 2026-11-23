class ApiConstant {
  // Android emulator : 10.0.2.2
  // iOS simulator    : 127.0.0.1
  // HP asli          : IP laptop kamu (contoh 192.168.1.10)
  static const String baseUrl = 'http://10.10.10.236:8000/api';

  static const String register = '$baseUrl/register';
  static const String login = '$baseUrl/login';
  static const String logout = '$baseUrl/logout';
  static const String user = '$baseUrl/user';
}

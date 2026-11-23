import 'package:flutter/material.dart';
import 'package:example/routes/app_route.dart';

void main() {
  runApp(const MyApp(isLoggedIn: false));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;

  const MyApp({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      debugShowCheckedModeBanner: false,
      initialRoute: isLoggedIn ? AppRoute.home : AppRoute.login,
      routes: AppRoute.routes,
    );
  }
}

// import 'package:flutter/material.dart';

// import 'pages/api_laravel/home_page.dart';
// import 'pages/api_laravel/login_page.dart';
// import 'services/auth_service.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   final token = await AuthService().getToken();
//   runApp(MyApp(isLoggedIn: token != null));
// }

// class MyApp extends StatelessWidget {
//   final bool isLoggedIn;
//   const MyApp({super.key, required this.isLoggedIn});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: isLoggedIn ? const HomePage() : const LoginPage(),
//     );
//   }
// }

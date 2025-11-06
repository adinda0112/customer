import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'auth/login_page.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const TemanTukangApp());
}

class TemanTukangApp extends StatelessWidget {
  const TemanTukangApp({super.key});

  Future<bool> _checkLogin() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLoggedIn') ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Teman Tukang',
      theme: ThemeData(primaryColor: const Color(0xFFFF9800)),
      home: FutureBuilder(
        future: _checkLogin(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(body: Center(child: CircularProgressIndicator()));
          }
          return snapshot.data == true ? const HomePage() : const LoginPage();
        },
      ),
    );
  }
}

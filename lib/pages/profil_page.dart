import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widgets/bottom_nav.dart';
import '../auth/login_page.dart';

class ProfilPage extends StatefulWidget {
  const ProfilPage({super.key});

  @override
  State<ProfilPage> createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  String email = '';

  @override
  void initState() {
    super.initState();
    _loadProfile();
  }

  Future<void> _loadProfile() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      email = prefs.getString('email') ?? 'user@mail.com';
    });
  }

  Future<void> _logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', false);
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const LoginPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profil'), backgroundColor: const Color(0xFFFF9800)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(children: [
          const CircleAvatar(radius: 40, backgroundColor: Colors.grey),
          const SizedBox(height: 12),
          const Text('Ahmad Imam', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          const SizedBox(height: 8),
          Text(email),
          const SizedBox(height: 24),
          Card(
            child: ListTile(
              leading: const Icon(Icons.phone),
              title: const Text('Nomor Telepon'),
              subtitle: const Text('+62 890-9875-1457'),
            ),
          ),
          const SizedBox(height: 12),
          Card(
            child: ListTile(
              leading: const Icon(Icons.email),
              title: const Text('Email'),
              subtitle: Text(email),
            ),
          ),
          const SizedBox(height: 12),
          Card(
            child: ListTile(
              leading: const Icon(Icons.location_on),
              title: const Text('Alamat'),
              subtitle: const Text('Desa apa rt 05'),
            ),
          ),
          const Spacer(),
          ElevatedButton(
            onPressed: _logout,
            style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFFF9800), padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 14)),
            child: const Text('Keluar'),
          ),
        ]),
      ),
      bottomNavigationBar: const BottomNav(currentIndex: 3),
    );
  }
}

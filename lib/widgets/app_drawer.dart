import 'package:flutter/material.dart';
import '../pages/riwayat_page.dart';
import '../pages/deteksi_page.dart';
import '../pages/chat_page.dart';
import '../pages/profil_page.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    Widget _tile(String title, IconData icon, Widget page) {
      return ListTile(
        leading: Icon(icon, color: const Color(0xFFFF9800)),
        title: Text(title),
        onTap: () {
          Navigator.pop(context);
          Navigator.push(context, MaterialPageRoute(builder: (_) => page));
        },
      );
    }

    return Drawer(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
          child: Column(
            children: [
              const CircleAvatar(radius: 36, backgroundColor: Colors.grey),
              const SizedBox(height: 12),
              const Text('Ahmad Imam', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 24),
              _tile('Beranda', Icons.home, Scaffold(body: const Center(child: Text('Beranda')))),
              _tile('Riwayat Pesanan', Icons.history, const RiwayatPage()),
              _tile('Deteksi', Icons.camera_alt, const DeteksiPage()),
              _tile('Chat Tukang', Icons.chat, const ChatPage()),
              _tile('Profil', Icons.person, const ProfilPage()),
            ],
          ),
        ),
      ),
    );
  }
}

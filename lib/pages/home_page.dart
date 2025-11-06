import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';
import '../widgets/bottom_nav.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        title: const Text('Teman Tukang'),
        backgroundColor: const Color(0xFFFF9800),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            height: 140,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.grey.shade300,
              image: const DecorationImage(
                image: AssetImage('assets/images/banner.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            alignment: Alignment.bottomLeft,
            padding: const EdgeInsets.all(16),
            child: const Text('Halo, selamat datang!\nTeman Tukang Jago',
                style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 24),
          const Text('Layanan Teman Tukang', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            children: [
              _serviceCard(context, 'Riwayat Pesanan', Icons.history),
              _serviceCard(context, 'Deteksi', Icons.camera_alt),
              _serviceCard(context, 'Chat', Icons.chat),
              _serviceCard(context, 'Profil', Icons.person),
            ],
          ),
          const SizedBox(height: 16),
          const Text('Panduan', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          SizedBox(
            height: 110,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, i) => Container(
                width: 180,
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), boxShadow: [
                  BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 6)
                ]),
                child: const Center(child: Text('Panduan')),
              ),
              separatorBuilder: (_, __) => const SizedBox(width: 12),
              itemCount: 3,
            ),
          )
        ]),
      ),
      bottomNavigationBar: const BottomNav(currentIndex: 0),
    );
  }

  Widget _serviceCard(BuildContext context, String title, IconData icon) {
    return GestureDetector(
      onTap: () {
        switch (title) {
          case 'Riwayat Pesanan':
            Navigator.push(context, MaterialPageRoute(builder: (_) => const Scaffold(body: Center(child: Text('Riwayat Pesanan')),)));
            break;
          case 'Deteksi':
            Navigator.push(context, MaterialPageRoute(builder: (_) => const Scaffold(body: Center(child: Text('Deteksi')),)));
            break;
          case 'Chat':
            Navigator.push(context, MaterialPageRoute(builder: (_) => const Scaffold(body: Center(child: Text('Chat')),)));
            break;
          case 'Profil':
            Navigator.push(context, MaterialPageRoute(builder: (_) => const Scaffold(body: Center(child: Text('Profil')),)));
            break;
        }
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 2,
        child: Center(
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Icon(icon, color: const Color(0xFFFF9800), size: 36),
            const SizedBox(height: 8),
            Text(title)
          ]),
        ),
      ),
    );
  }
}

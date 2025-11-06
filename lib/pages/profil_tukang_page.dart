import 'package:flutter/material.dart';
import '../widgets/bottom_nav.dart';

class ProfilTukangPage extends StatelessWidget {
  const ProfilTukangPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profil Tukang'), backgroundColor: const Color(0xFFFF9800)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(children: [
            Container(width: 90, height: 90, decoration: BoxDecoration(color: Colors.grey.shade300, borderRadius: BorderRadius.circular(12))),
            const SizedBox(width: 16),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [
              Text('Ahmad Imam', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              SizedBox(height: 6),
              Text('Keahlian: Pipa, renovasi rumah'),
            ])
          ]),
          const SizedBox(height: 20),
          const Text('Pengalaman', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const Text('- Pembangunan Rumah\n- Renovasi Rumah\n- Perbaikan Pipa'),
          const SizedBox(height: 18),
          const Text('Rating', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Row(children: [
            const Text('4.9', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(width: 8),
            Row(children: List.generate(5, (i) => const Icon(Icons.star, color: Colors.amber, size: 18)))
          ]),
          const SizedBox(height: 18),
          const Text('Ulasan', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Card(
            child: ListTile(
              leading: const CircleAvatar(child: Text('A')),
              title: const Text('Aulia'),
              subtitle: const Text('Tukang, pekerjaannya cepat dan rapi'),
            ),
          )
        ]),
      ),
      bottomNavigationBar: const BottomNav(currentIndex: 1),
    );
  }
}

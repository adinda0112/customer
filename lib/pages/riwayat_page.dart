import 'package:flutter/material.dart';
import '../widgets/bottom_nav.dart';

class RiwayatPage extends StatelessWidget {
  const RiwayatPage({super.key});

  @override
  Widget build(BuildContext context) {
    final orders = [
      {'title': 'Perbaikan Pipa Bocor', 'tukang': 'Ahmad Imam', 'date': '12 Nov 2025'},
      {'title': 'Perbaikan Listrik', 'tukang': 'Budi Santoso', 'date': '02 Okt 2025'},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Riwayat Pesanan'), backgroundColor: const Color(0xFFFF9800)),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: orders.length,
        itemBuilder: (context, i) {
          final o = orders[i];
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              title: Text(o['title']!),
              subtitle: Text('${o['tukang']} • ${o['date']}'),
              trailing: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                decoration: BoxDecoration(color: Colors.green.shade50, borderRadius: BorderRadius.circular(8)),
                child: const Text('Selesai', style: TextStyle(color: Colors.green)),
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: const BottomNav(currentIndex: 0),
    );
  }
}

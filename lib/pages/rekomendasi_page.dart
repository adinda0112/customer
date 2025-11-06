import 'package:flutter/material.dart';
import '../widgets/bottom_nav.dart';
import 'profil_tukang_page.dart';

class RekomendasiPage extends StatelessWidget {
  const RekomendasiPage({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      {'title': 'Perbaikan Pipa Bocor', 'tukang': 'Ahmad Imam', 'rating': 4.8},
      {'title': 'Perbaikan Pipa Bocor', 'tukang': 'Budi Santoso', 'rating': 4.6},
      {'title': 'Perbaikan Pipa Bocor', 'tukang': 'Siti Nur', 'rating': 4.7},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Rekomendasi'), backgroundColor: const Color(0xFFFF9800)),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: items.length,
        itemBuilder: (context, i) {
          final it = items[i];
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              leading: Container(width: 56, height: 56, decoration: BoxDecoration(color: Colors.grey.shade300, borderRadius: BorderRadius.circular(8))),
              title: Text(it['title'] as String),
              subtitle: Row(children: [
                Text(it['tukang'] as String),
                const SizedBox(width: 8),
                Row(children: List.generate(5, (j) => Icon(j < (it['rating'] as double).round() ? Icons.star : Icons.star_border, size: 14, color: Colors.amber))),
              ]),
              trailing: ElevatedButton(
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ProfilTukangPage())),
                style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFFF9800)),
                child: const Text('Pilih'),
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: const BottomNav(currentIndex: 1),
    );
  }
}

import 'package:flutter/material.dart';
import '../widgets/bottom_nav.dart';
import 'rekomendasi_page.dart';

class HasilDeteksiPage extends StatelessWidget {
  const HasilDeteksiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hasil Deteksi'), backgroundColor: const Color(0xFFFF9800)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(children: [
          Container(
            height: 220,
            width: double.infinity,
            decoration: BoxDecoration(color: Colors.grey.shade300, borderRadius: BorderRadius.circular(12), image: const DecorationImage(image: AssetImage('assets/images/damage.jpg'), fit: BoxFit.cover)),
          ),
          const SizedBox(height: 12),
          const Text('Hasil Deteksi Kerusakan', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const Text('Analisis faktor kerusakan:'),
          const SizedBox(height: 8),
          const Text('• Retak dinding bagian bawah\n• Struktur terpapar air', textAlign: TextAlign.left),
          const SizedBox(height: 18),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => const RekomendasiPage()));
            },
            style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFFF9800), padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14)),
            child: const Text('Rekomendasi'),
          )
        ]),
      ),
      bottomNavigationBar: const BottomNav(currentIndex: 1),
    );
  }
}

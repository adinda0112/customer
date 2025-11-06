import 'package:flutter/material.dart';
import '../widgets/bottom_nav.dart';
import 'hasil_deteksi_page.dart';

class DeteksiPage extends StatelessWidget {
  const DeteksiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Deteksi'), backgroundColor: const Color(0xFFFF9800)),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const SizedBox(height: 40),
            Container(
              height: 180,
              width: double.infinity,
              decoration: BoxDecoration(color: Colors.grey.shade200, borderRadius: BorderRadius.circular(12)),
              child: const Center(child: Icon(Icons.camera_alt, size: 64, color: Colors.grey)),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // dummy -> langsung ke hasil deteksi
                Navigator.push(context, MaterialPageRoute(builder: (_) => const HasilDeteksiPage()));
              },
              style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFFF9800), padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14)),
              child: const Text('Upload Gambar'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNav(currentIndex: 1),
    );
  }
}

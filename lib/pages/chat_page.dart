import 'package:flutter/material.dart';
import '../widgets/bottom_nav.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    final chats = [
      {'name': 'Ahmad Imam', 'message': 'Hai, tukang saya perbaiki bocor'},
      {'name': 'Budi', 'message': 'Siap, kapan bisa datang?'},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Chat'), backgroundColor: const Color(0xFFFF9800)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(children: [
          const TextField(decoration: InputDecoration(prefixIcon: Icon(Icons.search), hintText: 'Cari tukang...')),
          const SizedBox(height: 12),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, i) {
                final c = chats[i];
                return ListTile(
                  leading: const CircleAvatar(backgroundColor: Colors.grey),
                  title: Text(c['name']!),
                  subtitle: Text(c['message']!),
                  onTap: () {
                    // buka chat detail (dummy)
                    showModalBottomSheet(context: context, builder: (_) {
                      return SizedBox(
                        height: 360,
                        child: Column(children: [
                          AppBar(title: Text(c['name']!), backgroundColor: const Color(0xFFFF9800)),
                          Expanded(child: ListView(children: const [
                            ListTile(title: Text('Ahmad'), subtitle: Text('Halo, saya datang jam 10')),
                            ListTile(title: Text('Kamu'), subtitle: Text('Oke, terima kasih')),
                          ])),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(children: [
                              Expanded(child: TextField(decoration: const InputDecoration(hintText: 'Ketik pesan...'))),
                              IconButton(icon: const Icon(Icons.send, color: Color(0xFFFF9800)), onPressed: () => Navigator.pop(context))
                            ]),
                          )
                        ]),
                      );
                    });
                  },
                );
              },
              separatorBuilder: (_, __) => const Divider(),
              itemCount: chats.length,
            ),
          )
        ]),
      ),
      bottomNavigationBar: const BottomNav(currentIndex: 2),
    );
  }
}

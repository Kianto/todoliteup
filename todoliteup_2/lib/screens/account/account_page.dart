import 'package:flutter/material.dart';
import 'package:todoliteup/screens/account/animation_bg.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chào bạn"),
      ),
      body: Stack(
        children: [
          const AnimationBgView(49),
          Container(color: Colors.white70),
          ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Image.network(
                'https://cdn.iconscout.com/icon/free/png-256/free-avatar-370-456322.png?f=webp',
                width: 80,
                height: 80,
              ),
              const SizedBox(height: 16),
              const ListTile(
                title: Text(
                  'Inl Opark',
                  textAlign: TextAlign.center,
                ),
                subtitle: Text(
                  '047589040',
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

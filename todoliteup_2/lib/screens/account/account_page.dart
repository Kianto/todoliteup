import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoliteup/screens/account/animation_bg.dart';

import 'controllers/account_controller.dart';

class AccountPage extends GetWidget<AccountController> {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chào bạn"),
      ),
      body: Stack(
        children: [
          Obx(
            () => AnimationBgView(controller.randNum.value),
          ),
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
              OutlinedButton(
                onPressed: () => controller.getRandomNumber(),
                child: const Text('Roll'),
              ),
              const Divider(),
              OutlinedButton(
                onPressed: () => controller.support(),
                child: Text(
                  'Hỗ trợ',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.error,
                  ),
                ),
              ),
              OutlinedButton(
                onPressed: () => controller.message(),
                child: Text(
                  'Tin nhắn',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.error,
                  ),
                ),
              ),
              const Divider(),
              TextButton(
                onPressed: () => controller.logout(),
                child: Text(
                  'Đăng xuất',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.error,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

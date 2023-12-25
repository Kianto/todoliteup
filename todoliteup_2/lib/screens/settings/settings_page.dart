import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/settings_controller.dart';

class SettingsPage extends GetWidget<SettingsController> {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cài đặt"),
      ),
      body: ListView(
        children: [
          const ListTile(
            title: Text('Hi'),
          ),
          Obx(
            () => SwitchListTile.adaptive(
              value: controller.lightOn.value,
              onChanged: (val) => controller.lightOn.value = val,
              title: const Text(
                'Chế độ sáng',
              ),
            ),
          ),
          ListTile(
            title: const Text(
              'Cài đặt thông báo',
            ),
            trailing: const Icon(Icons.navigate_next),
            onTap: () => _onNotificationSettings(context),
          ),
          ListTile(
            title: const Text(
              'Cài đặt tự động chuyển khi hết hạn',
            ),
            trailing: const Icon(Icons.navigate_next),
            onTap: () => _onAutoMoveSettings(context),
          ),
          ListTile(
            title: const Text(
              'Cài đặt tự động xoá khi đã hoàn thành',
            ),
            trailing: const Icon(Icons.navigate_next),
            onTap: () => _onAutoRemoveSettings(context),
          ),
          ListTile(
            title: const Text(
              'Cài đặt tự động gom nhóm quá hạn',
            ),
            trailing: const Icon(Icons.navigate_next),
            onTap: () => _onAutoGroupSettings(context),
          ),
        ],
      ),
    );
  }

  void _onNotificationSettings(BuildContext context) {
    // TODO:
  }

  void _onAutoMoveSettings(BuildContext context) {
    // TODO:
  }

  void _onAutoRemoveSettings(BuildContext context) {
    // TODO:
  }

  void _onAutoGroupSettings(BuildContext context) {
    // TODO:
  }
}

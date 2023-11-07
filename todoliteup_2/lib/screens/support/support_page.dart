import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/support_controller.dart';

class SupportPage extends GetWidget<SupportController> {
  const SupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hỗ trợ"),
      ),
      body: ListView(
        children: const [
          ListTile(
            title: Text('Hi'),
          ),
        ],
      ),
    );
  }
}

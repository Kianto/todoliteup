import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/message_controller.dart';

class MessagePage extends GetWidget<MessageController> {
  const MessagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tin nhắn"),
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

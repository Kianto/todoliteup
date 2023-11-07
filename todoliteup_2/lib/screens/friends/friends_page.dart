import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/friends_controller.dart';

class FriendsPage extends GetWidget<FriendsController> {
  const FriendsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bạn bè"),
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

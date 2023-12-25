import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/feedback_controller.dart';

class FeedbackPage extends GetWidget<FeedbackController> {
  const FeedbackPage({super.key});

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

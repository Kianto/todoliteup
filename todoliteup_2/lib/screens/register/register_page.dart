import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/register_controller.dart';

class RegisterPage extends GetWidget<RegisterController> {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Đăng ký"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ElevatedButton(
            child: const Text(
              'Đăng ký',
            ),
            onPressed: () => controller.register(),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/login_controller.dart';

class LoginPage extends GetWidget<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Đăng nhập"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ElevatedButton(
            child: const Text(
              'Đăng nhập',
            ),
            onPressed: () => controller.login(),
          ),
        ),
      ),
    );
  }
}

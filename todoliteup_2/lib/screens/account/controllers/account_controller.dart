import 'dart:math';

import 'package:get/get.dart';
import 'package:todoliteup/screens/login/login_binding.dart';
import 'package:todoliteup/screens/login/login_page.dart';

class AccountController extends GetxController {
  final randNum = 20.obs;

  int getRandomNumber() {
    final number = Random().nextInt(20) + 10;

    randNum.value = number;

    return number;
  }

  void logout() {
    Get.offAll(() => const LoginPage(), binding: LoginBinding());
  }
}

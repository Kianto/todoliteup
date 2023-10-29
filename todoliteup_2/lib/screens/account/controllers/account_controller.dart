import 'dart:math';

import 'package:get/get.dart';
import 'package:todoliteup/screens/login/login_binding.dart';
import 'package:todoliteup/screens/login/login_page.dart';
import 'package:todoliteup/screens/message/message_binding.dart';
import 'package:todoliteup/screens/message/message_page.dart';
import 'package:todoliteup/screens/settings/settings_binding.dart';
import 'package:todoliteup/screens/settings/settings_page.dart';
import 'package:todoliteup/screens/support/support_binding.dart';
import 'package:todoliteup/screens/support/support_page.dart';

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

  void support() {
    Get.to(() => const SupportPage(), binding: SupportBinding());
  }

  void message() {
    Get.to(() => const MessagePage(), binding: MessageBinding());
  }

  void settings() {
    Get.to(() => const SettingsPage(), binding: SettingsBinding());
  }
}

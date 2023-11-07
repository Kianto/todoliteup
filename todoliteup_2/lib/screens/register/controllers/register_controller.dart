import 'dart:math';

import 'package:get/get.dart';
import 'package:todoliteup/screens/home/home_binding.dart';
import 'package:todoliteup/screens/home/home_page.dart';

class RegisterController extends GetxController {
  final randNum = 20.obs;

  int getRandomNumber() {
    final number = Random().nextInt(20) + 10;

    randNum.value = number;

    return number;
  }

  void register() {
    Get.offAll(() => const HomePage(), binding: HomeBinding());
  }
}

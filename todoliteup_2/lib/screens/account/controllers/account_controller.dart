import 'dart:math';

import 'package:get/get.dart';

class AccountController extends GetxController {
  final randNum = 20.obs;

  int getRandomNumber() {
    final number = Random().nextInt(20) + 10;

    randNum.value = number;

    return number;
  }
}

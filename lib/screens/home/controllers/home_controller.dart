import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoliteup/domain/usecases/ts_create_task.dart';
import 'package:todoliteup/injection_container.dart';
import 'package:todoliteup/models/task.dart';
import 'package:todoliteup/res/strings.dart';

class HomeController extends GetxController {
  bool get kTestMode => Platform.environment.containsKey('FLUTTER_TEST');

  CreateTask get createTask => sl();

  final _isLoading = false.obs;
  get isLoading => _isLoading.value;

  final _currentIndex = 0.obs;
  get currentIndex => _currentIndex.value;
  PageController pageController = PageController();

  @override
  onClose() {
    pageController.dispose();
    super.onClose();
  }

  void pageChange(int value) {
    _currentIndex.value = value;
    pageController.jumpToPage(value);
  }

  Future<void> addTask(String title, String detail) async {
    return _onSaveTap(MTask(title: title, description: detail));
  }

  Future _onSaveTap(MTask task) async {
    Get.dialog(
      const SimpleDialog(
        children: [
          SizedBox(
            height: 100,
            child: Center(child: CircularProgressIndicator()),
          ),
        ],
      ),
      barrierDismissible: false,
    );

    _isLoading.value = true;
    final resId = await _saveNewTask(task);
    Get.back();
    if (!kTestMode) {
      if (resId == null) {
        Get.snackbar(StringRes.failed, StringRes.failedMsg);
      } else {
        Get.snackbar(StringRes.success, StringRes.successMsg);
      }
    }
    _isLoading.value = false;
  }

  Future<int?> _saveNewTask(MTask newTask) {
    return createTask(newTask).then((value) {
      return value.fold((l) => null, (r) => r);
    });
  }
}

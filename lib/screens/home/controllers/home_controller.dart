import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoliteup/models/task.dart';
import 'package:todoliteup/repos/dynamic_repo.dart';
import 'package:todoliteup/res/strings.dart';

class HomeController extends GetxController{

  final DynamicRepo<Task> repo;

  HomeController({required this.repo});

  var _isLoading = false.obs;
  get isLoading => _isLoading.value;

  var _currentIndex = 0.obs;
  get currentIndex => _currentIndex.value;
  PageController pageController = PageController();


  @override
  onInit() {
    super.onInit();
  }

  @override
  onClose() {
    pageController.dispose();
    super.onClose();
  }

  void pageChange(int value) {
    _currentIndex.value = value;
    pageController.jumpToPage(value);
  }

  Future<void> addTask() async {
    final formKey = GlobalKey<FormState>();
    final newTask = Task();
    Get.dialog(
      AlertDialog(
        title: Text(StringRes.doing),
        content: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: StringRes.title,
                ),
                onSaved: (val) => newTask.title = val ?? '',
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: StringRes.description,
                ),
                onSaved: (val) => newTask.description = val ?? '',
              ),
            ],
            mainAxisSize: MainAxisSize.min,
          ),
        ),
        actions: [
          TextButton(
            onPressed: Get.back,
            child: Text(StringRes.cancel),
          ),
          ElevatedButton(
            onPressed: () {
              Get.back(result: true);

              formKey.currentState!.save();
              _onSaveTap(newTask);
            },
            child: Text(StringRes.ok),
          ),
        ],
      ),
    );
  }

  _onSaveTap(Task task) async {
    Get.dialog(
      SimpleDialog(
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
    await saveNewTask(task);
    Get.back();
    _isLoading.value = false;
  }

  Future saveNewTask(Task newTask) {
    return repo.saveData(newTask);
  }

}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoliteup/models/task.dart';
import 'package:todoliteup/repos/dynamic_repo.dart';

class TaskController extends GetxController{

  final DynamicRepo<Task> repo;
  final int? status;

  TaskController.all({required this.repo}) : status = null;
  TaskController.doing({required this.repo}) : status = Task.DOING_STATUS;
  TaskController.done({required this.repo}) : status = Task.DONE_STATUS;

  var _tasks = <Task>[].obs;
  set tasks(value) => _tasks.assignAll(value);
  List<Task> get tasks => _tasks;

  var _isLoading = false.obs;
  get isLoading => _isLoading.value;


  @override
  onInit() {
    super.onInit();
  }

  getList() async {
    _isLoading.value = true;
    switch(status) {
      case null:
        tasks = await repo.getList();
        break;
      case Task.DOING_STATUS:
        tasks = await repo.getListBy("status", Task.DOING_STATUS);
        break;
      case Task.DONE_STATUS:
        tasks = await repo.getListBy("status", Task.DONE_STATUS);
        break;
    }
    _isLoading.value = false;
  }

  updateTask(Task task) async {
    await repo.update(task);

    // check if cur screen is not all then change
    if (status != null) {
      _tasks.remove(task);
    }
    _tasks.refresh();
  }

  changeStatus(Task task, int status) async {
    await repo.update(task..status = status);

    // check if cur screen is not all then change
    if (null != this.status && this.status != status) {
      _tasks.remove(task);
    }
    _tasks.refresh();
  }

}

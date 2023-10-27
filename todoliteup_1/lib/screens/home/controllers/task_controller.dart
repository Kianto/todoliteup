import 'dart:io';

import 'package:get/get.dart';
import 'package:todoliteup/domain/usecases/ts_delete_task.dart';
import 'package:todoliteup/domain/usecases/ts_get_tasks.dart';
import 'package:todoliteup/domain/usecases/ts_update_task.dart';
import 'package:todoliteup/injection_container.dart';
import 'package:todoliteup/models/task.dart';
import 'package:todoliteup/res/strings.dart';

class TaskController extends GetxController with StateMixin<List<MTask>> {
  bool get kTestMode => Platform.environment.containsKey('FLUTTER_TEST');

  final int? type;

  TaskController.all() : type = null;
  TaskController.doing() : type = MTask.stDoing;
  TaskController.done() : type = MTask.stDone;

  GetTasks get _getTasks => sl();
  UpdateTask get _updateTask => sl();
  DeleteTask get _deleteTask => sl();

  void getList() async {
    change(null, status: RxStatus.loading());
    List<MTask> tasks = [];
    switch (type) {
      case null:
        final data = await _getTasks(null);
        tasks = data.fold((l) => null, (r) => r) ?? [];
        break;
      case MTask.stDoing:
        final data = await _getTasks(MTask.stDoing);
        tasks = data.fold((l) => null, (r) => r) ?? [];
        break;
      case MTask.stDone:
        final data = await _getTasks(MTask.stDone);
        tasks = data.fold((l) => null, (r) => r) ?? [];
        break;
    }
    if (tasks.isEmpty) {
      change(tasks, status: RxStatus.empty());
    } else {
      change(tasks, status: RxStatus.success());
    }
  }

  void deleteTask(MTask task) async {
    final res = await _deleteTask(task.id).then((value) {
      return value.right;
    });
    if (!kTestMode) {
      if (res) {
        Get.snackbar(StringRes.success, StringRes.successMsg);
      } else {
        Get.snackbar(StringRes.failed, StringRes.failedMsg);
      }
    }
    getList();
  }

  void updateTask(MTask task) async {
    final res = await _updateTask(task).then((value) {
      return value.right;
    });
    if (!kTestMode) {
      if (res) {
        Get.snackbar(StringRes.success, StringRes.successMsg);
      } else {
        Get.snackbar(StringRes.failed, StringRes.failedMsg);
      }
    }
    getList();
  }

  void changeStatus(MTask task, int status) async {
    updateTask(
      MTask(
        id: task.id,
        title: task.title,
        description: task.description,
        image: task.image,
        status: status,
      ),
    );
  }
}

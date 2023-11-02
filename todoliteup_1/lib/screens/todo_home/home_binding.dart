import 'package:get/get.dart';
import 'package:todolite/models/task.dart';
import 'package:todolite/screens/todo_home/controllers/task_controller.dart';

import 'controllers/todo_controller.dart';

class TodoBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TodoController());
    Get.lazyPut(() => TaskController.all());
    Get.lazyPut(() => TaskController.doing(), tag: MTask.stDoing.toString());
    Get.lazyPut(() => TaskController.done(), tag: MTask.stDone.toString());
  }
}

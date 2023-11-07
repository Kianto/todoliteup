import 'package:get/get.dart';
import 'package:todo0/models/task.dart';
import 'package:todo0/screens/task/controllers/task_controller.dart';

import 'controllers/todo_controller.dart';

class TaskBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TodoController());
    Get.lazyPut(() => TaskController.all());
    Get.lazyPut(() => TaskController.doing(), tag: MTask.stDoing.toString());
    Get.lazyPut(() => TaskController.done(), tag: MTask.stDone.toString());
  }
}

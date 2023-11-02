import 'package:get/get.dart';
import 'package:todolite/models/task.dart';
import 'package:todolite/screens/home/controllers/task_controller.dart';

import 'controllers/home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => TaskController.all());
    Get.lazyPut(() => TaskController.doing(), tag: MTask.stDoing.toString());
    Get.lazyPut(() => TaskController.done(), tag: MTask.stDone.toString());
  }
}

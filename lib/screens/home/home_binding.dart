import 'package:get/get.dart';
import 'package:todoliteup/models/task.dart';
import 'package:todoliteup/screens/home/controllers/task_controller.dart';

import 'controllers/home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => TaskController.all());
    Get.lazyPut(() => TaskController.doing(), tag: MTask.ST_DOING.toString());
    Get.lazyPut(() => TaskController.done(), tag: MTask.ST_DONE.toString());
  }
}
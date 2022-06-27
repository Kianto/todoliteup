import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

import 'package:todoliteup/models/task.dart';
import 'package:todoliteup/screens/home/controllers/home_controller.dart';
import 'package:todoliteup/screens/home/controllers/task_controller.dart';
import 'package:todoliteup/screens/home/home_binding.dart';

void main() {
  group('Todo Tasks', () {

    // HomeBinding().dependencies();
    // final homeCtrler = Get.find<HomeController>();
    // final taskAllCtrler = Get.find<TaskController>();
    // final taskDoingCtrler = Get.find<TaskController>(tag: '${MTask.ST_DOING}');
    // final taskDoneCtrler = Get.find<TaskController>(tag: '${MTask.ST_DONE}');
    //
    // test('Page should load a list of tasks', () async {
    //   await taskAllCtrler.getList();
    //   expect(taskAllCtrler.state?.length, 6);
    //
    //   await taskDoingCtrler.getList();
    //   expect(taskDoingCtrler.state?.length, 5);
    //
    //   await taskDoneCtrler.getList();
    //   expect(taskDoneCtrler.state?.length, 1);
    // });
    //
    // test('Doing Task Page should move done-tasks', () async {
    //   await taskDoingCtrler.getList();
    //   expect(taskDoingCtrler.state?.length, 5);
    //
    //   await taskDoingCtrler.changeStatus(taskDoingCtrler.state?.first, MTask.ST_DONE);
    //
    //   // doing list should decrease 1
    //   expect(taskDoingCtrler.state?.length, 4);
    //
    //   // done list should inc 1
    //   await taskDoneCtrler.getList();
    //   expect(taskDoneCtrler.state?.length, 2);
    // });
    //
    // test('Task Page should add new doing-tasks', () async {
    //   await taskAllCtrler.getList();
    //   expect(taskAllCtrler.state?.length, 6);
    //
    //   await homeCtrler.saveNewTask(MTask(
    //     title: '',
    //     description: '',
    //   ));
    //
    //   // all task list should inc 1
    //   await taskAllCtrler.getList();
    //   expect(taskAllCtrler.state?.length, 7);
    //
    //   // doing list should inc 1
    //   await taskDoingCtrler.getList();
    //   expect(taskDoingCtrler.state?.length, 5);
    // });

  });
}

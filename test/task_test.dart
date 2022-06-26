import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

import 'package:todoliteup/models/task.dart';
import 'package:todoliteup/screens/home/controllers/home_controller.dart';
import 'package:todoliteup/screens/home/controllers/task_controller.dart';
import 'package:todoliteup/screens/home/home_binding.dart';

// run # flutter test test/task_test.dart
void main() {
  group('Todo Tasks', () {

    HomeBinding().dependencies();
    final homeCtrler = Get.find<HomeController>();
    final taskAllCtrler = Get.find<TaskController>();
    final taskDoingCtrler = Get.find<TaskController>(tag: '${Task.DOING_STATUS}');
    final taskDoneCtrler = Get.find<TaskController>(tag: '${Task.DONE_STATUS}');

    test('Page should load a list of tasks', () async {
      await taskAllCtrler.getList();
      expect(taskAllCtrler.tasks.length, 6);

      await taskDoingCtrler.getList();
      expect(taskDoingCtrler.tasks.length, 5);

      await taskDoneCtrler.getList();
      expect(taskDoneCtrler.tasks.length, 1);
    });

    test('Doing Task Page should move done-tasks', () async {
      await taskDoingCtrler.getList();
      expect(taskDoingCtrler.tasks.length, 5);

      await taskDoingCtrler.changeStatus(taskDoingCtrler.tasks.first, Task.DONE_STATUS);

      // doing list should decrease 1
      expect(taskDoingCtrler.tasks.length, 4);

      // done list should inc 1
      await taskDoneCtrler.getList();
      expect(taskDoneCtrler.tasks.length, 2);
    });

    test('Task Page should add new doing-tasks', () async {
      await taskAllCtrler.getList();
      expect(taskAllCtrler.tasks.length, 6);

      await homeCtrler.saveNewTask(Task(
        title: '',
        description: '',
      ));

      // all task list should inc 1
      await taskAllCtrler.getList();
      expect(taskAllCtrler.tasks.length, 7);

      // doing list should inc 1
      await taskDoingCtrler.getList();
      expect(taskDoingCtrler.tasks.length, 5);
    });

  });
}

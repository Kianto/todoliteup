import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoliteup/models/task.dart';
import 'package:todoliteup/screens/home/controllers/task_controller.dart';

import 'task_item.dart';

class TaskListTab extends StatelessWidget {

  TaskListTab.all() : status = null;
  TaskListTab.doing() : status = Task.DOING_STATUS;
  TaskListTab.done() : status = Task.DONE_STATUS;

  final int? status;
  TaskController get controller => Get.find<TaskController>(tag: status?.toString());

  @override
  Widget build(BuildContext context) {
    controller.getList();

    return Obx(() {
      if (controller.isLoading) {
        return Center(
          child: CircularProgressIndicator(),
        );
      }

      return ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
        itemCount: controller.tasks.length,
        itemBuilder: (c, i) => TaskItem(
          task: controller.tasks[i],
          onStatusChanged: (status) => controller.changeStatus(
              controller.tasks[i], status,
          ),
        ),
        separatorBuilder: (c, i) => Divider(),
      );
    });
  }
}
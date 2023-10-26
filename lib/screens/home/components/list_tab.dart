import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoliteup/common/loading_widget.dart';
import 'package:todoliteup/common/no_data_widget.dart';
import 'package:todoliteup/models/task.dart';
import 'package:todoliteup/screens/home/controllers/task_controller.dart';

import 'task_item.dart';

class TaskListTab extends StatelessWidget {
  const TaskListTab.all({super.key}) : status = null;
  const TaskListTab.doing({super.key}) : status = MTask.stDoing;
  const TaskListTab.done({super.key}) : status = MTask.stDone;

  final int? status;
  TaskController get controller =>
      Get.find<TaskController>(tag: status?.toString());

  @override
  Widget build(BuildContext context) {
    controller.getList();

    return controller.obx(
      (state) {
        return ListView.separated(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
          itemCount: state?.length ?? 0,
          itemBuilder: (c, i) => TaskItem(
            task: state![i],
            onStatusChanged: (status) => controller.changeStatus(
              state[i],
              status,
            ),
            onDelete: () => controller.deleteTask(state[i]),
          ),
          separatorBuilder: (c, i) => const Divider(),
        );
      },
      onLoading: const LoadingWidget(),
      onEmpty: const NoDataWidget(),
      onError: (error) => const NoDataWidget(),
    );
  }
}

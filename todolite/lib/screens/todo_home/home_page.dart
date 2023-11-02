import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:todolite/models/task.dart';
import 'package:todolite/res/strings.dart';
import 'package:todolite/screens/todo_home/components/list_tab.dart';

import 'controllers/todo_controller.dart';
import 'controllers/task_controller.dart';

class HomePage extends GetWidget<TodoController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(StringRes.appName),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Card(
              elevation: 0,
              color: Colors.white38,
              child: IconButton(
                onPressed: () => _addTask(context),
                icon: const Icon(Icons.add),
              ),
            ),
          ),
        ],
      ),
      body: _buildBody(),
      bottomNavigationBar: _buildBottomBar(),
    );
  }

  Widget _buildBody() {
    final page = [
      _getPage(const TaskListTab.all()),
      _getPage(const TaskListTab.doing()),
      _getPage(const TaskListTab.done()),
    ];

    return PageView(
      controller: controller.pageController,
      onPageChanged: controller.pageChange,
      children: page,
    );
  }

  Widget _getPage(Widget pageTab) {
    return Obx(() {
      if (controller.isLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      return pageTab;
    });
  }

  Widget _buildBottomBar() {
    final itemList = [
      const BottomNavigationBarItem(
        icon: Icon(Icons.assignment_outlined),
        label: StringRes.all,
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.assignment_late_outlined),
        label: StringRes.doing,
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.assignment_turned_in_outlined),
        label: StringRes.done,
      ),
    ];

    return Obx(
      () => BottomNavigationBar(
        currentIndex: controller.currentIndex,
        onTap: controller.pageChange,
        items: itemList,
      ),
    );
  }

  void _addTask(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final titleCtrler = TextEditingController();
    final detailCtrler = TextEditingController();
    Get.dialog(
      AlertDialog(
        title: const Text(StringRes.doing),
        content: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                key: const ValueKey(0),
                decoration: const InputDecoration(
                  labelText: StringRes.title,
                ),
                inputFormatters: [
                  LengthLimitingTextInputFormatter(100),
                ],
                controller: titleCtrler,
                validator: _validateRequired,
              ),
              TextFormField(
                key: const ValueKey(1),
                decoration: const InputDecoration(
                  labelText: StringRes.description,
                ),
                maxLines: 3,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(250),
                ],
                controller: detailCtrler,
                validator: _validateRequired,
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: Get.back,
            child: const Text(StringRes.cancel),
          ),
          ElevatedButton(
            onPressed: () {
              if (!formKey.currentState!.validate()) return;
              formKey.currentState!.save();
              Get.back(result: true);

              controller
                  .addTask(
                titleCtrler.text.trim(),
                detailCtrler.text.trim(),
              )
                  .then((_) {
                Get.find<TaskController>().getList();
                Get.find<TaskController>(tag: '${MTask.stDoing}').getList();
              });
            },
            child: const Text(StringRes.ok),
          ),
        ],
      ),
    );
  }

  String? _validateRequired(String? val) {
    if (val == null) return StringRes.errorRequired;
    if (val.trim().isEmpty) return StringRes.errorRequired;
    return null;
  }
}

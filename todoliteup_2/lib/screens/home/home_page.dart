import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:todoliteup/models/task.dart';
import 'package:todoliteup/res/strings.dart';
import 'package:todoliteup/screens/account/account_binding.dart';
import 'package:todoliteup/screens/account/account_page.dart';
import 'package:todoliteup/screens/home/components/list_tab.dart';

import 'controllers/home_controller.dart';
import 'controllers/task_controller.dart';

class HomePage extends GetWidget<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(StringRes.appName),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: IconButton(
              onPressed: () => Get.to(
                () => const AccountPage(),
                binding: AccountBinding(),
              ),
              icon: const Icon(Icons.account_circle),
            ),
          ),
        ],
      ),
      body: _buildBody(context),
      bottomNavigationBar: _buildBottomBar(context),
      floatingActionButton: Semantics(
        label: 'fab_add_task',
        child: FloatingActionButton.extended(
          onPressed: () => _addTask(context),
          icon: const Icon(Icons.add),
          label: const Text(StringRes.add),
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
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

  Widget _buildBottomBar(BuildContext context) {
    final itemList = {
      StringRes.all: Icons.assignment_outlined,
      StringRes.doing: Icons.assignment_late_outlined,
      StringRes.done: Icons.assignment_turned_in_outlined,
    };
    return Obx(
      () => SizedBox(
        height: kBottomNavigationBarHeight,
        child: Row(
          children: [
            for (int i = 0; i < itemList.length; i++)
              Expanded(
                child: _buildBottomItem(
                  context,
                  Icon(itemList.values.elementAt(i)),
                  itemList.keys.elementAt(i),
                  isSelected: controller.currentIndex == i,
                  onTap: () => controller.pageChange(i),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomItem(
    BuildContext context,
    Widget icon,
    String label, {
    bool isSelected = false,
    VoidCallback? onTap,
  }) {
    return InkResponse(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconTheme(
            data: IconThemeData(
              color: isSelected
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).unselectedWidgetColor,
            ),
            child: icon,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 2.0),
            child: Text(
              label,
              style: TextStyle(
                color: isSelected
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).unselectedWidgetColor,
              ),
            ),
          ),
        ],
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

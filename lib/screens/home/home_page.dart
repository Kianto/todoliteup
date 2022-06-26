import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoliteup/res/strings.dart';
import 'package:todoliteup/screens/home/components/list_tab.dart';

import 'controllers/home_controller.dart';

class HomePage extends GetWidget<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(StringRes.appName),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: IconButton(
              onPressed: controller.addTask,
              icon: Icon(Icons.add),
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
      _getPage(TaskListTab.all()),
      _getPage(TaskListTab.doing()),
      _getPage(TaskListTab.done()),
    ];

    return PageView(
      controller: controller.pageController,
      children: page,
      onPageChanged: controller.pageChange,
    );
  }

  Widget _getPage(Widget pageTab) {
    return Obx(() {
      if (controller.isLoading) {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
      return pageTab;
    });
  }

  Widget _buildBottomBar() {
    final itemList = [
      BottomNavigationBarItem(
        icon: Icon(Icons.assignment_outlined),
        label: StringRes.all,
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.assignment_late_outlined),
        label: StringRes.doing,
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.assignment_turned_in_outlined),
        label: StringRes.done,
      ),
    ];

    return Obx(() => BottomNavigationBar(
      currentIndex: controller.currentIndex,
      onTap: controller.pageChange,
      items: itemList,
    ));
  }

}

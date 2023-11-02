import 'package:get/get.dart';
import 'package:todo0/screens/todo_home/task_binding.dart';
import 'package:todo0/screens/todo_home/task_page.dart';

part 'app_routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.home,
      page: () => const HomePage(),
      binding: TaskBinding(),
    ),
  ];
}

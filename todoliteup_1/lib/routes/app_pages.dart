import 'package:get/get.dart';
import 'package:todolite/screens/splash/splash_binding.dart';
import 'package:todolite/screens/splash/splash_page.dart';
import 'package:todolite/screens/todo_home/home_binding.dart';
import 'package:todolite/screens/todo_home/home_page.dart';

part 'app_routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.home,
      page: () => const HomePage(),
      binding: TodoBinding(),
    ),
    GetPage(
      name: Routes.splash,
      page: () => const SplashScreen(),
      binding: SplashBinding(),
    ),
  ];
}

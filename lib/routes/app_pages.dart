import 'package:get/get.dart';
import 'package:todoliteup/screens/home/home_binding.dart';
import 'package:todoliteup/screens/home/home_page.dart';

part './app_routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.home,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
  ];
}

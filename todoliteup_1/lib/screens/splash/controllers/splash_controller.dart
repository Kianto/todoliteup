import 'package:get/get.dart';
import 'package:todolite/screens/todo_home/home_binding.dart';
import 'package:todolite/screens/todo_home/home_page.dart';

class SplashController extends GetxController {
  final isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();

    Future.delayed(const Duration(milliseconds: 300)).then((_) {
      Get.offAll(() => const HomePage(), binding: TodoBinding());
      return isLoading.value = false;
    });
  }
}

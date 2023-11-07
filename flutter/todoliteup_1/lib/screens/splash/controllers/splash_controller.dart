import 'package:get/get.dart';
import 'package:todolite/screens/todo_home/home_binding.dart';
import 'package:todolite/screens/todo_home/home_page.dart';

class SplashController extends GetxController {
  final isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();

    init();
  }

  void init() async {
    await Future.delayed(const Duration(milliseconds: 300));
    Get.offAll(() => const HomePage(), binding: TodoBinding());
    isLoading.value = false;
  }
}

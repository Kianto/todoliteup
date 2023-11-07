import 'package:get/get.dart';

import 'controllers/support_controller.dart';

class SupportBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SupportController());
  }
}

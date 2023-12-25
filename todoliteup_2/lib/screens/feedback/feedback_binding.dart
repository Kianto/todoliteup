import 'package:get/get.dart';

import 'controllers/feedback_controller.dart';

class FeedbackBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FeedbackController());
  }
}

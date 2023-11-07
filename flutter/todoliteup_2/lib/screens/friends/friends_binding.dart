import 'package:get/get.dart';

import 'controllers/friends_controller.dart';

class FriendsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FriendsController());
  }
}

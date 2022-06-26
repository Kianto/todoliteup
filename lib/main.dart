import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoliteup/res/strings.dart';

import 'routes/app_pages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: StringRes.appName,
      getPages: AppPages.pages,
      initialRoute: Routes.HOME,
      debugShowCheckedModeBanner: false,
    );
  }
}

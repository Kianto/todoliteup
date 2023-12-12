import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todoliteup/res/strings.dart';

import 'injection_container.dart' as di;
import 'res/const.dart';
import 'routes/app_pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDirectory = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  await Hive.openBox(ConstRes.appId);
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: StringRes.appName,
      getPages: AppPages.pages,
      initialRoute: Routes.home,
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        return Banner(
          location: BannerLocation.topStart,
          message: 'Kianto',
          color: Colors.black,
          child: child,
        );
      },
    );
  }
}

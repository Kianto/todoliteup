import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';

import 'data/data_injection_container.dart' as data;
import 'domain/domain_injection_container.dart' as domain;
import 'res/const.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerLazySingleton<Box>(() => Hive.box(ConstRes.appId));

  // presentation
  data.init();
  domain.init();
}

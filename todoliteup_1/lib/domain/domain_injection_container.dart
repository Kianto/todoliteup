import 'package:get_it/get_it.dart';

import 'usecases/ts_create_task.dart';
import 'usecases/ts_delete_task.dart';
import 'usecases/ts_get_task_detail.dart';
import 'usecases/ts_get_tasks.dart';
import 'usecases/ts_update_task.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Use cases
  sl.registerLazySingleton(() => CreateTask(sl()));
  sl.registerLazySingleton(() => UpdateTask(sl()));
  sl.registerLazySingleton(() => DeleteTask(sl()));
  sl.registerLazySingleton(() => GetTasks(sl()));
  sl.registerLazySingleton(() => GetTaskDetail(sl()));
}

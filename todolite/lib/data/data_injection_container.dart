import 'package:get_it/get_it.dart';
import 'package:todo0/models/task.dart';

import 'datasources/data_source.dart';
import 'datasources/local_data_source.dart';
import 'repositories/repository.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Data sources
  sl.registerLazySingleton<LocalDataSource<MTask>>(
    () => LocalDataSourceImpl<MTask>(sl()),
  );

  // Repo
  sl.registerLazySingleton<DataRepo>(
    () => DataRepo(
      localDataSource: sl(),
    ),
  );
}

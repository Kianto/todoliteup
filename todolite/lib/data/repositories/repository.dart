import 'package:todo0/models/task.dart';

import '../datasources/data_source.dart';

class DataRepo {
  final LocalDataSource<MTask> localDataSource;

  DataRepo({
    required this.localDataSource,
  });
}

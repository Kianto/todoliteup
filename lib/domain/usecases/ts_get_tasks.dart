import 'package:dartz/dartz.dart';
import 'package:todoliteup/models/task.dart';

import '../../core/error/failures.dart';
import '../../core/usecases/usecase.dart';
import '../../data/repositories/repository.dart';
import '../middle_handlers/middle_handle_result.dart';

class GetTasks extends UseCase<List<MTask>, int?> {
  GetTasks(this.repo);

  final DataRepo repo;

  @override
  Future<Either<Failure, List<MTask>>> call(int? params) {
    if (params == null) {
      return MiddleHandleResult.checkResult<List<MTask>>(
        () async => await repo.localDataSource.getList(),
      );
    } else {
      return MiddleHandleResult.checkResult<List<MTask>>(
        () async => await repo.localDataSource.getListBy("status", params),
      );
    }
  }
}

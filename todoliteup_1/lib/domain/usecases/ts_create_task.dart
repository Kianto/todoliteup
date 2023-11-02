import 'package:dartz/dartz.dart';
import 'package:todolite/models/task.dart';

import '../../core/error/failures.dart';
import '../../core/usecases/usecase.dart';
import '../../data/repositories/repository.dart';
import '../middle_handlers/middle_handle_result.dart';

class CreateTask extends UseCase<int, MTask> {
  CreateTask(this.repo);

  final DataRepo repo;

  @override
  Future<Either<Failure, int>> call(MTask params) {
    return MiddleHandleResult.checkResult<int>(
      () async => await repo.localDataSource.saveData(params),
    );
  }
}

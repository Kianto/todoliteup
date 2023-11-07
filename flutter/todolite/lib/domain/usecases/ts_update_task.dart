import 'package:dartz/dartz.dart';
import 'package:todo0/models/task.dart';

import '../../core/error/failures.dart';
import '../../core/usecases/usecase.dart';
import '../../data/repositories/repository.dart';
import '../middle_handlers/middle_handle_result.dart';

class UpdateTask extends UseCase<bool, MTask> {
  UpdateTask(this.repo);

  final DataRepo repo;

  @override
  Future<Either<Failure, bool>> call(MTask params) {
    return MiddleHandleResult.checkResult<bool>(
      () async => await repo.localDataSource.updateData(params.id, params),
    );
  }
}

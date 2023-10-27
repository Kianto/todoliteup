import 'package:either_dart/either.dart';
import 'package:todoliteup/models/task.dart';

import '../../core/error/failures.dart';
import '../../core/usecases/usecase.dart';
import '../../data/repositories/repository.dart';
import '../middle_handlers/middle_handle_result.dart';

class GetTaskDetail extends UseCase<MTask, int> {
  GetTaskDetail(this.repo);

  final DataRepo repo;

  @override
  Future<Either<Failure, MTask>> call(int params) {
    return MiddleHandleResult.checkResult<MTask>(
      () async => await repo.localDataSource.getDetail(params),
    );
  }
}

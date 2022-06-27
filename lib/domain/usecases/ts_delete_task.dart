import 'package:dartz/dartz.dart';

import '../../core/error/failures.dart';
import '../../core/usecases/usecase.dart';
import '../../data/repositories/repository.dart';
import '../middle_handlers/middle_handle_result.dart';

class DeleteTask extends UseCase<bool, int> {
  DeleteTask(this.repo);

  final DataRepo repo;

  @override
  Future<Either<Failure, bool>> call(int params) {
    return MiddleHandleResult.checkResult<bool>(
          () async => await repo.localDataSource.deleteData(params),
    );
  }
}

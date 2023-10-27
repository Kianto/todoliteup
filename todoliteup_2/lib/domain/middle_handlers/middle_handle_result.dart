import 'package:either_dart/either.dart';

import '../../core/error/exceptions.dart';
import '../../core/error/failures.dart';

abstract class MiddleHandleResult {
  static Future<Either<Failure, T>> checkResult<T>(
    Function function, {
    bool checkAuth = true,
    bool checkInvalid = true,
    bool checkDuplicated = true,
    bool checkOverLimit = true,
    bool checkNotFound = true,
  }) async {
    try {
      final data = await function.call();
      return Right(data);
    } on ServerException {
      return Left(ServerFailure());
    }

    // local exception
    on CacheException {
      return Left(CacheFailure());
    }
  }
}

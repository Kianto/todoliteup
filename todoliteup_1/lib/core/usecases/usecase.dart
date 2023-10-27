import 'package:either_dart/either.dart';
import 'package:fast_equatable/fast_equatable.dart';

import '../error/failures.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams with FastEquatable {
  @override
  bool get cacheHash => true;

  @override
  List<Object?> get hashParameters => [];
}

import 'package:fast_equatable/fast_equatable.dart';

abstract class Failure with FastEquatable {
  @override
  bool get cacheHash => true;

  @override
  List<Object?> get hashParameters => [];
}

// General failures
class ServerFailure extends Failure {}

// Unauthorized failures
class UnauthorizedFailure extends Failure {}

// General failures
class BadRequestFailure extends Failure {}

// General failures
class NotFoundFailure extends Failure {}

// Cache failures
class CacheFailure extends Failure {}

// Duplicated failures (Unofficial)
class DuplicatedFailure extends Failure {}

// Invalid data failures (Unofficial)
class InvalidDataFailure extends Failure {}

// Create data over limit (Unofficial)
class OverLimitFailure extends Failure {}

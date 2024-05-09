import 'package:fast_equatable/fast_equatable.dart';

sealed class Failure with FastEquatable {
  @override
  bool get cacheHash => true;

  @override
  List<Object?> get hashParameters => [];
}

// General failures
class ServerFailure extends Failure {
  @override
  bool get cacheHash => true;

  @override
  List<Object?> get hashParameters {
    super.hashParameters;
    return [];
  }
}

// Unauthorized failures
class UnauthorizedFailure extends Failure {
  @override
  bool get cacheHash => true;

  @override
  List<Object?> get hashParameters {
    super.hashParameters;
    return [];
  }
}

// General failures
class BadRequestFailure extends Failure {
  @override
  bool get cacheHash => true;

  @override
  List<Object?> get hashParameters {
    super.hashParameters;
    return [];
  }
}

// General failures
class NotFoundFailure extends Failure {
  @override
  bool get cacheHash => true;

  @override
  List<Object?> get hashParameters {
    super.hashParameters;
    return [];
  }
}

// Cache failures
class CacheFailure extends Failure {
  @override
  bool get cacheHash => true;

  @override
  List<Object?> get hashParameters {
    super.hashParameters;
    return [];
  }
}

// Duplicated failures (Unofficial)
class DuplicatedFailure extends Failure {
  @override
  bool get cacheHash => true;

  @override
  List<Object?> get hashParameters {
    super.hashParameters;
    return [];
  }
}

// Invalid data failures (Unofficial)
class InvalidDataFailure extends Failure {
  @override
  bool get cacheHash => true;

  @override
  List<Object?> get hashParameters {
    super.hashParameters;
    return [];
  }
}

// Create data over limit (Unofficial)
class OverLimitFailure extends Failure {
  @override
  bool get cacheHash => true;

  @override
  List<Object?> get hashParameters {
    super.hashParameters;
    return [];
  }
}

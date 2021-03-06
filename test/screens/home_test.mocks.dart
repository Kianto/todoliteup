// Mocks generated by Mockito 5.2.0 from annotations
// in todoliteup/test/screens/home_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i5;

import 'package:dartz/dartz.dart' as _i3;
import 'package:mockito/mockito.dart' as _i1;
import 'package:todoliteup/core/error/failures.dart' as _i6;
import 'package:todoliteup/data/repositories/repository.dart' as _i2;
import 'package:todoliteup/domain/usecases/ts_create_task.dart' as _i4;
import 'package:todoliteup/domain/usecases/ts_delete_task.dart' as _i9;
import 'package:todoliteup/domain/usecases/ts_get_task_detail.dart' as _i11;
import 'package:todoliteup/domain/usecases/ts_get_tasks.dart' as _i10;
import 'package:todoliteup/domain/usecases/ts_update_task.dart' as _i8;
import 'package:todoliteup/models/task.dart' as _i7;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeDataRepo_0 extends _i1.Fake implements _i2.DataRepo {}

class _FakeEither_1<L, R> extends _i1.Fake implements _i3.Either<L, R> {}

/// A class which mocks [CreateTask].
///
/// See the documentation for Mockito's code generation for more information.
class MockCreateTask extends _i1.Mock implements _i4.CreateTask {
  MockCreateTask() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.DataRepo get repo => (super.noSuchMethod(Invocation.getter(#repo),
      returnValue: _FakeDataRepo_0()) as _i2.DataRepo);
  @override
  _i5.Future<_i3.Either<_i6.Failure, int>> call(_i7.MTask? params) =>
      (super.noSuchMethod(Invocation.method(#call, [params]),
              returnValue: Future<_i3.Either<_i6.Failure, int>>.value(
                  _FakeEither_1<_i6.Failure, int>()))
          as _i5.Future<_i3.Either<_i6.Failure, int>>);
}

/// A class which mocks [UpdateTask].
///
/// See the documentation for Mockito's code generation for more information.
class MockUpdateTask extends _i1.Mock implements _i8.UpdateTask {
  MockUpdateTask() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.DataRepo get repo => (super.noSuchMethod(Invocation.getter(#repo),
      returnValue: _FakeDataRepo_0()) as _i2.DataRepo);
  @override
  _i5.Future<_i3.Either<_i6.Failure, bool>> call(_i7.MTask? params) =>
      (super.noSuchMethod(Invocation.method(#call, [params]),
              returnValue: Future<_i3.Either<_i6.Failure, bool>>.value(
                  _FakeEither_1<_i6.Failure, bool>()))
          as _i5.Future<_i3.Either<_i6.Failure, bool>>);
}

/// A class which mocks [DeleteTask].
///
/// See the documentation for Mockito's code generation for more information.
class MockDeleteTask extends _i1.Mock implements _i9.DeleteTask {
  MockDeleteTask() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.DataRepo get repo => (super.noSuchMethod(Invocation.getter(#repo),
      returnValue: _FakeDataRepo_0()) as _i2.DataRepo);
  @override
  _i5.Future<_i3.Either<_i6.Failure, bool>> call(int? params) =>
      (super.noSuchMethod(Invocation.method(#call, [params]),
              returnValue: Future<_i3.Either<_i6.Failure, bool>>.value(
                  _FakeEither_1<_i6.Failure, bool>()))
          as _i5.Future<_i3.Either<_i6.Failure, bool>>);
}

/// A class which mocks [GetTasks].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetTasks extends _i1.Mock implements _i10.GetTasks {
  MockGetTasks() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.DataRepo get repo => (super.noSuchMethod(Invocation.getter(#repo),
      returnValue: _FakeDataRepo_0()) as _i2.DataRepo);
  @override
  _i5.Future<_i3.Either<_i6.Failure, List<_i7.MTask>>> call(int? params) =>
      (super.noSuchMethod(Invocation.method(#call, [params]),
          returnValue: Future<_i3.Either<_i6.Failure, List<_i7.MTask>>>.value(
              _FakeEither_1<_i6.Failure, List<_i7.MTask>>())) as _i5
          .Future<_i3.Either<_i6.Failure, List<_i7.MTask>>>);
}

/// A class which mocks [GetTaskDetail].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetTaskDetail extends _i1.Mock implements _i11.GetTaskDetail {
  MockGetTaskDetail() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.DataRepo get repo => (super.noSuchMethod(Invocation.getter(#repo),
      returnValue: _FakeDataRepo_0()) as _i2.DataRepo);
  @override
  _i5.Future<_i3.Either<_i6.Failure, _i7.MTask>> call(int? params) =>
      (super.noSuchMethod(Invocation.method(#call, [params]),
              returnValue: Future<_i3.Either<_i6.Failure, _i7.MTask>>.value(
                  _FakeEither_1<_i6.Failure, _i7.MTask>()))
          as _i5.Future<_i3.Either<_i6.Failure, _i7.MTask>>);
}

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:todo0/core/error/exceptions.dart';
import 'package:todo0/data/datasources/data_source.dart';
import 'package:todo0/domain/domain_injection_container.dart' as domain;
import 'package:todo0/data/repositories/repository.dart';
import 'package:todo0/domain/usecases/ts_create_task.dart';
import 'package:todo0/domain/usecases/ts_delete_task.dart';
import 'package:todo0/domain/usecases/ts_get_task_detail.dart';
import 'package:todo0/domain/usecases/ts_get_tasks.dart';
import 'package:todo0/domain/usecases/ts_update_task.dart';
import 'package:todo0/models/task.dart';

import 'usecase_test.mocks.dart';

@GenerateMocks([LocalDataSource])
void main() {
  late LocalDataSource<MTask> local;

  setUp(() async {
    local = MockLocalDataSource<MTask>();
    final dataSource = DataRepo(localDataSource: local);
    domain.sl.registerLazySingleton<DataRepo>(() => dataSource);
    domain.init();
  });
  tearDown(() async {
    await domain.sl.reset();
  });

  group('usecases get testing', () {
    test(
      '''function called ok''',
      () async {
        // arrange
        when(local.getList()).thenAnswer(
          (_) async => [
            MTask(
              title: "title",
              description: "description",
              status: 1,
            ),
            MTask(
              title: "title",
              description: "description",
              status: 1,
            ),
            MTask(
              title: "title",
              description: "description",
              status: 0,
            ),
          ],
        );
        // act
        final listAll = await domain.sl<GetTasks>().call(null);
        // assert
        verify(local.getList());
        expect(listAll.isRight(), true);

        // arrange
        when(local.getListBy("status", MTask.stDone)).thenAnswer(
          (_) async => [
            MTask(
              title: "title",
              description: "description",
              status: 1,
            ),
            MTask(
              title: "title",
              description: "description",
              status: 1,
            ),
          ],
        );
        // act
        final listDone = await domain.sl<GetTasks>().call(MTask.stDone);
        // assert
        verify(local.getListBy("status", MTask.stDone));
        expect(listDone.isRight(), true);
        expect(listDone.fold((l) => null, (r) => r)?.length, 2);

        // arrange
        when(local.getListBy("status", MTask.stDoing)).thenAnswer(
          (_) async => [
            MTask(
              title: "title",
              description: "description",
              status: 0,
            ),
          ],
        );
        // act
        final listDoing = await domain.sl<GetTasks>().call(MTask.stDoing);
        // assert
        verify(local.getListBy("status", MTask.stDoing));
        expect(listDoing.isRight(), true);
        expect(listDoing.fold((l) => null, (r) => r)?.length, 1);
      },
    );

    test(
      '''function called error''',
      () async {
        // arrange
        when(local.getList()).thenAnswer((_) async => throw ServerException());
        // act
        final listAll = await domain.sl<GetTasks>().call(null);
        // assert
        verify(local.getList());
        expect(listAll.isLeft(), true);

        // arrange
        when(local.getListBy("status", MTask.stDone))
            .thenAnswer((_) async => throw ServerException());
        // act
        final listDone = await domain.sl<GetTasks>().call(MTask.stDone);
        // assert
        verify(local.getListBy("status", MTask.stDone));
        expect(listDone.isLeft(), true);

        // arrange
        when(local.getListBy("status", MTask.stDoing))
            .thenAnswer((_) async => throw ServerException());
        // act
        final listDoing = await domain.sl<GetTasks>().call(MTask.stDoing);
        // assert
        verify(local.getListBy("status", MTask.stDoing));
        expect(listDoing.isLeft(), true);
      },
    );
  });

  group('usecases data testing', () {
    test(
      '''function called get ok''',
      () async {
        // arrange
        final data = MTask(title: "title", description: "description");
        when(local.getDetail(10)).thenAnswer((_) async => data);
        // act
        final val = await domain.sl<GetTaskDetail>().call(10);
        // assert
        verify(local.getDetail(10));
        expect(val.isRight(), true);
      },
    );

    test(
      '''function called get error''',
      () async {
        // arrange
        when(local.getDetail(10))
            .thenAnswer((_) async => throw CacheException());
        // act
        final val = await domain.sl<GetTaskDetail>().call(10);
        // assert
        verify(local.getDetail(10));
        expect(val.isLeft(), true);
      },
    );

    test(
      '''function called create ok''',
      () async {
        // arrange
        final data = MTask(title: "title", description: "description");
        when(local.saveData(data)).thenAnswer((_) async => 1002);
        // act
        final listAll = await domain.sl<CreateTask>().call(data);
        // assert
        verify(local.saveData(data));
        expect(listAll.isRight(), true);
      },
    );

    test(
      '''function called create error''',
      () async {
        // arrange
        final data = MTask(title: "title", description: "description");
        when(local.saveData(data))
            .thenAnswer((_) async => throw CacheException());
        // act
        final listAll = await domain.sl<CreateTask>().call(data);
        // assert
        verify(local.saveData(data));
        expect(listAll.isLeft(), true);
      },
    );

    test(
      '''function called update ok''',
      () async {
        // arrange
        final data = MTask(id: 10, title: "title", description: "description");
        when(local.updateData(10, data)).thenAnswer((_) async => true);
        // act
        final listAll = await domain.sl<UpdateTask>().call(data);
        // assert
        verify(local.updateData(10, data));
        expect(listAll.isRight(), true);
      },
    );

    test(
      '''function called update error''',
      () async {
        // arrange
        final data = MTask(id: 10, title: "title", description: "description");
        when(local.updateData(10, data))
            .thenAnswer((_) async => throw CacheException());
        // act
        final listAll = await domain.sl<UpdateTask>().call(data);
        // assert
        verify(local.updateData(10, data));
        expect(listAll.isLeft(), true);
      },
    );

    test(
      '''function called delete ok''',
      () async {
        // arrange
        when(local.deleteData(10)).thenAnswer((_) async => true);
        // act
        final listAll = await domain.sl<DeleteTask>().call(10);
        // assert
        verify(local.deleteData(10));
        expect(listAll.isRight(), true);
      },
    );

    test(
      '''function called delete error''',
      () async {
        // arrange
        when(local.deleteData(10))
            .thenAnswer((_) async => throw CacheException());
        // act
        final listAll = await domain.sl<DeleteTask>().call(10);
        // assert
        verify(local.deleteData(10));
        expect(listAll.isLeft(), true);
      },
    );
  });
}

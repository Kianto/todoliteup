import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:todoliteup/core/error/exceptions.dart';
import 'package:todoliteup/data/datasources/data_source.dart';
import 'package:todoliteup/domain/domain_injection_container.dart' as DomainDI;
import 'package:todoliteup/data/repositories/repository.dart';
import 'package:todoliteup/domain/usecases/ts_create_task.dart';
import 'package:todoliteup/domain/usecases/ts_delete_task.dart';
import 'package:todoliteup/domain/usecases/ts_get_task_detail.dart';
import 'package:todoliteup/domain/usecases/ts_get_tasks.dart';
import 'package:todoliteup/domain/usecases/ts_update_task.dart';
import 'package:todoliteup/models/task.dart';

import 'usecase_test.mocks.dart';

@GenerateMocks([LocalDataSource])
void main() {
  late LocalDataSource<MTask> local;

  setUp(() async {
    local = MockLocalDataSource<MTask>();
    final dataSource = DataRepo(localDataSource: local);
    DomainDI.sl.registerLazySingleton<DataRepo>(() => dataSource);
    DomainDI.init();
  });
  tearDown(() async {
    await DomainDI.sl.reset();
  });

  group('usecases get testing', () {
    test(
      '''function called ok''',
          () async {
            // arrange
            when(local.getList()).thenAnswer((_) async => [
              MTask(title: "title", description: "description", status: 1),
              MTask(title: "title", description: "description", status: 1),
              MTask(title: "title", description: "description", status: 0),
            ]);
            // act
            final listAll = await DomainDI.sl<GetTasks>().call(null);
            // assert
            verify(local.getList());
            expect(listAll.isRight(), true);

            // arrange
            when(local.getListBy("status", MTask.ST_DONE)).thenAnswer((_) async => [
              MTask(title: "title", description: "description", status: 1),
              MTask(title: "title", description: "description", status: 1),
            ]);
            // act
            final listDone = await DomainDI.sl<GetTasks>().call(MTask.ST_DONE);
            // assert
            verify(local.getListBy("status", MTask.ST_DONE));
            expect(listDone.isRight(), true);
            expect(listDone.fold((l) => null, (r) => r)?.length, 2);

            // arrange
            when(local.getListBy("status", MTask.ST_DOING)).thenAnswer((_) async => [
              MTask(title: "title", description: "description", status: 0),
            ]);
            // act
            final listDoing = await DomainDI.sl<GetTasks>().call(MTask.ST_DOING);
            // assert
            verify(local.getListBy("status", MTask.ST_DOING));
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
        final listAll = await DomainDI.sl<GetTasks>().call(null);
        // assert
        verify(local.getList());
        expect(listAll.isLeft(), true);

        // arrange
        when(local.getListBy("status", MTask.ST_DONE)).thenAnswer((_) async => throw ServerException());
        // act
        final listDone = await DomainDI.sl<GetTasks>().call(MTask.ST_DONE);
        // assert
        verify(local.getListBy("status", MTask.ST_DONE));
        expect(listDone.isLeft(), true);

        // arrange
        when(local.getListBy("status", MTask.ST_DOING)).thenAnswer((_) async => throw ServerException());
        // act
        final listDoing = await DomainDI.sl<GetTasks>().call(MTask.ST_DOING);
        // assert
        verify(local.getListBy("status", MTask.ST_DOING));
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
        final val = await DomainDI.sl<GetTaskDetail>().call(10);
        // assert
        verify(local.getDetail(10));
        expect(val.isRight(), true);
      },
    );

    test(
      '''function called get error''',
          () async {
        // arrange
        when(local.getDetail(10)).thenAnswer((_) async => throw CacheException());
        // act
        final val = await DomainDI.sl<GetTaskDetail>().call(10);
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
        final listAll = await DomainDI.sl<CreateTask>().call(data);
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
            when(local.saveData(data)).thenAnswer((_) async => throw CacheException());
        // act
            final listAll = await DomainDI.sl<CreateTask>().call(data);
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
        final listAll = await DomainDI.sl<UpdateTask>().call(data);
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
        when(local.updateData(10, data)).thenAnswer((_) async => throw CacheException());
        // act
        final listAll = await DomainDI.sl<UpdateTask>().call(data);
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
        final listAll = await DomainDI.sl<DeleteTask>().call(10);
        // assert
        verify(local.deleteData(10));
        expect(listAll.isRight(), true);
      },
    );

    test(
      '''function called delete error''',
          () async {
        // arrange
        final data = MTask(id: 10, title: "title", description: "description");
        when(local.deleteData(10)).thenAnswer((_) async => throw CacheException());
        // act
        final listAll = await DomainDI.sl<DeleteTask>().call(10);
        // assert
        verify(local.deleteData(10));
        expect(listAll.isLeft(), true);
      },
    );
  });

}

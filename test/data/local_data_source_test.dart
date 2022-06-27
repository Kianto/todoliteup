import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:hive_test/hive_test.dart';
import 'package:todoliteup/core/error/exceptions.dart';
import 'package:todoliteup/data/data_injection_container.dart' as DataDI;
import 'package:todoliteup/data/repositories/repository.dart';
import 'package:todoliteup/models/task.dart';
import 'package:todoliteup/res/const.dart';

void main() {
  late DataRepo dataSource;
  late Box box;

  setUp(() async {
    await setUpTestHive();
    box = await Hive.openBox(ConstRes.appId);
    DataDI.sl.registerLazySingleton<Box>(() => box);
    DataDI.init();
    dataSource = DataDI.sl();
  });
  tearDown(() async {
    await tearDownTestHive();
    await DataDI.sl.reset();
  });

  group('tasks local storage testing', () {
    test(
      '''blank local box must have some items''',
          () async {
        // arrange
        final data = MTask(title: "title", description: "description");
        // act
        int id = await dataSource.localDataSource.saveData(data);
        // assert
        expect(id, isNotNull);
        expect(box.length, 1);
        // act
        id = await dataSource.localDataSource.saveData(data);
        // assert
        expect(id, isNotNull);
        expect(box.length, 2);
        // act
        final list = await dataSource.localDataSource.getList();
        // assert
        expect(list.length, 2);

        // arrange
        box.close();
        // assert
        expect(dataSource.localDataSource.getList(), throwsA(isA<CacheException>()));
      },
    );

    test(
      '''get saved data and update''',
          () async {
        // arrange
        final data = MTask(title: "title", description: "description1");
        final newData = MTask(title: "title2", description: "description");
        int id = await dataSource.localDataSource.saveData(data);
        // act
        final item = await dataSource.localDataSource.getDetail(id);
        // assert
        expect(item?.title, "title");
        // act
        await dataSource.localDataSource.updateData(id, newData);
        final item2 = await dataSource.localDataSource.getDetail(id);
        // assert
        expect(item2?.title, "title2");

        // arrange
        box.close();
        // assert
        expect(dataSource.localDataSource.saveData(data), throwsA(isA<CacheException>()));
        expect(dataSource.localDataSource.updateData(id, newData), throwsA(isA<CacheException>()));
      },
    );

    test(
      '''remove a item''',
          () async {
            // arrange
            final data = MTask(title: "title", description: "description");
            // act
            int id = await dataSource.localDataSource.saveData(data);
            // assert
            expect(box.length, 1);
            // act
            await dataSource.localDataSource.deleteData(id);
            // assert
            expect(box.length, 0);

            // arrange
            box.close();
            // assert
            expect(dataSource.localDataSource.deleteData(id), throwsA(isA<CacheException>()));
      },
    );

    test(
      '''filter task by status''',
          () async {
        // arrange
        final data1 = MTask(title: "title", description: "description", status: MTask.ST_DOING);
        final data2 = MTask(title: "title", description: "description", status: MTask.ST_DONE);
        // act
        await dataSource.localDataSource.saveData(data1);
        await dataSource.localDataSource.saveData(data1);
        await dataSource.localDataSource.saveData(data2);
        // assert
        expect(box.length, 3);
        // act
        final list0 = await dataSource.localDataSource.getListBy("status", MTask.ST_DOING);
        // assert
        expect(list0.length, 2);
        // act
        final list1 = await dataSource.localDataSource.getListBy("status", MTask.ST_DONE);
        // assert
        expect(list1.length, 1);

        // arrange
        box.close();
        // assert
        expect(dataSource.localDataSource.getListBy("status", MTask.ST_DONE), throwsA(isA<CacheException>()));
      },
    );
  });

}

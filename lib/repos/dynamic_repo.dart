import 'package:todoliteup/models/entity.dart';
import 'package:todoliteup/models/entity_factory.dart';
import 'package:todoliteup/models/task.dart';

class DynamicRepo<T extends Entity> {
  static Map poolData = <Type, List<Entity>>{};

  List<T> get examples => poolData[T];

  Future<T?> getById(int id) async {
    await Future.delayed(Duration(milliseconds: 500));

    try {
      return Future.value(
          examples.firstWhere((e) => e.id == id)
      );
    } on Exception catch (e) {
      print(e);
      return Future.value(null);
    }
  }

  Future<List<T>> getList() async {
    await Future.delayed(Duration(milliseconds: 500));

    if (poolData[T] == null || poolData[T].isEmpty) {
      if (T == Task) {
        int i = 1;
        poolData[T] = [
          EntityFactory.getEntity(T, {
            "id": i++,
            "title": "Đi du lịch biển",
            "description": "Làm một cái gì đấy có mô tả rõ ràng ở đây.",
          }) as T,
          EntityFactory.getEntity(T, {
            "id": i++,
            "title": "Đi chùa",
            "description": "Làm một cái gì đấy có mô tả rõ ràng ở đây.",
          }) as T,
          EntityFactory.getEntity(T, {
            "id": i++,
            "title": "Đi họp nhóm ăn lẩu",
            "description": "Làm một cái gì đấy có mô tả rõ ràng ở đây.",
          }) as T,
          EntityFactory.getEntity(T, {
            "id": i++,
            "title": "Đi ngủ sớm",
            "description": "Làm một cái gì đấy có mô tả rõ ràng ở đây.",
          }) as T,
          EntityFactory.getEntity(T, {
            "id": i++,
            "title": "Đi chơi 🥲",
            "description": "Làm một cái gì đấy có mô tả rõ ràng ở đây.",
          }) as T,
          EntityFactory.getEntity(T, {
            "id": i++,
            "title": "Đi ra đi vào",
            "description": "Làm một cái gì đấy có mô tả rõ ràng ở đây.",
            "status": 1,
          }) as T,
        ];
      }
    }

    return Future.value(examples);
  }

  Future<List<T>> getListBy(String key, dynamic value) async {
    await Future.delayed(Duration(milliseconds: 500));

    return Future.value(examples.where(
            (e) => e.getValueOfKey(key) == value,
    ).toList());
  }

  update(T entity) async {
    await Future.delayed(Duration(milliseconds: 500));

    try {
      var old = examples.firstWhere((e) => e.id == entity.id);
      examples[examples.indexOf(old)] = entity;

    } on Exception catch (e) {
      print(e);
      return Future.value(false);
    }
  }

  saveData(T entity) async {
    await Future.delayed(Duration(milliseconds: 500));

    entity.id = poolData[T].length + 1;
    poolData[T].add(entity);
  }

}
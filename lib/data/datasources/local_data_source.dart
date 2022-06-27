import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:todoliteup/core/error/exceptions.dart';
import 'package:todoliteup/models/entity_factory.dart';

import '../../models/entity.dart';
import 'data_source.dart';

class LocalDataSourceImpl<T extends Entity> extends LocalDataSource<T> {
  final Box taskBox;

  LocalDataSourceImpl(this.taskBox);

  @override
  Future<bool> deleteData(int id) async {
    try {
      await taskBox.delete(id);
      return true;
    } catch(e) {
      debugPrint(e.toString());
      throw CacheException();
    }
  }

  @override
  Future<T?> getDetail(int id) async {
    try {
      final json = taskBox.get(id, defaultValue: null);
      return EntityFactory.getEntity(T, json) as T;
    } catch(e) {
      debugPrint(e.toString());
      throw CacheException();
    }
  }

  @override
  Future<List<T>> getList() async {
    try {
      return taskBox.values.map(
              (json) => EntityFactory.getEntity(T, Map<String, dynamic>.from(json)) as T
      ).toList();
    } catch(e) {
      debugPrint(e.toString());
      throw CacheException();
    }
  }

  @override
  Future<List<T>> getListBy(String key, dynamic value) async {
    try {
      return (
          await getList()).where((e) => e.getValueOfKey(key) == value
      ).toList();
    } catch(e) {
      debugPrint(e.toString());
      throw CacheException();
    }
  }

  @override
  Future<bool> updateData(int id, T data) async {
    try {
      deleteData(id);
      await taskBox.put(id, data.toJson()..addAll({"id" : id}));
      return true;
    } catch(e) {
      debugPrint(e.toString());
      throw CacheException();
    }
  }

  @override
  Future<int> saveData(T data) async {
    try {
      int id = taskBox.length + 1;
      while (taskBox.get(id, defaultValue: null) != null) {
        id ++;
      }

      await taskBox.put(id, data.toJson()..addAll({"id": id}));
      return id;
    } catch(e) {
      debugPrint(e.toString());
      throw CacheException();
    }
  }

}

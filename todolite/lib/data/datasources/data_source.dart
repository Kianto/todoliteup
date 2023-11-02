import 'package:todo0/models/entity.dart';

///
/// Store data in device local
///
abstract class LocalDataSource<T extends Entity> {
  Future<int> saveData(T data);
  Future<bool> deleteData(int id);
  Future<bool> updateData(int id, T data);
  Future<List<T>> getList();
  Future<List<T>> getListBy(String key, dynamic value);
  Future<T?> getDetail(int id);
}

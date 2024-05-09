import 'package:fast_equatable/fast_equatable.dart';

///
/// abstract model class for all model data containers to follow
///

abstract class Entity with FastEquatable {
  Entity({this.id = 0, this.created, this.deleted = false, this.updated});

  Entity.fromJson(Map<String, dynamic> json)
      : id = json['id'] ?? 0,
        deleted = json['deleted'] ?? false,
        created = json['created'],
        updated = json['updated'];

  final int id;

  final bool deleted;
  final DateTime? created;
  final DateTime? updated;

  dynamic getValueOfKey(String key) => null;
  Map<String, dynamic> toJson() => {
        "deleted": deleted,
        "created": created,
        "updated": updated,
      };

  @override
  bool get cacheHash => true;

  @override
  List<Object?> get hashParameters => [];
}

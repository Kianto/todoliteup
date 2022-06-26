///
/// abstract model class for all model data containers to follow
///

abstract class Entity {

  Entity({this.id});

  Entity.fromJson(Map<String, dynamic> json) {
    this.id = json['id'];

    this.isDeleted = json['isDeleted'];
    this.createTime = json['createTime'];
    this.updateTime = json['updateTime'];
  }

  Entity.copy(Entity temp) {
    this.id = temp.id;

    this.isDeleted = temp.isDeleted;
    this.createTime = temp.createTime;
    this.updateTime = temp.updateTime;
  }

  int? id;

  bool? isDeleted;
  DateTime? createTime;
  DateTime? updateTime;

  dynamic getValueOfKey(String key) => null;

}
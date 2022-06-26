import 'entity.dart';

class Task extends Entity {
  static const DOING_STATUS = 0;
  static const DONE_STATUS = 1;

  Task({
    this.title,
    this.description,
    this.status = DOING_STATUS,
  });

  @override
  Task.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    this.title = json['title'];
    this.description = json['description'];
    this.status = json['status'] ?? DOING_STATUS;
  }

  @override
  Task.copy(Task temp) : super.copy(temp) {
    this.title = temp.title;
    this.description = temp.description;
    this.status = temp.status;
  }

  String? title;
  String? description;
  int? status;

  @override
  dynamic getValueOfKey(String key) {
    switch (key) {
      case "title":
        return title;
      case "description":
        return description;
      case "status":
        return status;
    }
  }
}
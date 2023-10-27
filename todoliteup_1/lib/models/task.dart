import 'package:fast_equatable/fast_equatable.dart';

import 'entity.dart';

class MTask extends Entity {
  static const stDoing = 0;
  static const stDone = 1;

  MTask({
    super.id,
    super.created,
    super.updated,
    super.deleted,
    required this.title,
    required this.description,
    this.image,
    this.status = stDoing,
  });

  @override
  MTask.fromJson(Map<String, dynamic> json)
      : title = json['title'] ?? "",
        description = json['description'] ?? "",
        image = json['image'],
        status = json['status'] ?? stDoing,
        super.fromJson(json);

  final String title;
  final String description;
  final String? image;
  final int status;

  @override
  dynamic getValueOfKey(String key) {
    switch (key) {
      case "title":
        return title;
      case "description":
        return description;
      case "image":
        return image;
      case "status":
        return status;
    }
  }

  @override
  Map<String, dynamic> toJson() => {
        ...super.toJson(),
        "title": title,
        "description": description,
        "image": image,
        "status": status,
      };

  @override
  bool get cacheHash => true;

  @override
  List<Object?> get hashParameters => [id, title, status];
}

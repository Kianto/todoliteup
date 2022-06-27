import 'entity.dart';

class MTask extends Entity {
  static const ST_DOING = 0;
  static const ST_DONE = 1;

  const MTask({
    super.id,
    super.created,
    super.updated,
    super.deleted,
    required this.title,
    required this.description,
    this.status = ST_DOING,
  });

  @override
  MTask.fromJson(Map<String, dynamic> json) :
        title = json['title'] ?? "",
        description = json['description'] ?? "",
        status = json['status'] ?? ST_DOING,
        super.fromJson(json);


  final String title;
  final String description;
  final int status;

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

  @override
  List<Object?> get props => [id, title, status];

  @override
  Map<String, dynamic> toJson() => {
    ...super.toJson(),
    "title": title,
    "description": description,
    "status": status,
  };

}
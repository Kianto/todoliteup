import 'entity.dart';
import 'task.dart';

abstract class EntityFactory {
  static Entity? getEntity(Type type, Map<String, dynamic> json) {
    switch (type) {
      case MTask:
        return MTask.fromJson(json);
    }
    return null;
  }
}

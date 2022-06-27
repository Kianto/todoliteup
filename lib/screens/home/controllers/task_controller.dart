import 'package:get/get.dart';
import 'package:todoliteup/domain/usecases/ts_delete_task.dart';
import 'package:todoliteup/domain/usecases/ts_get_tasks.dart';
import 'package:todoliteup/domain/usecases/ts_update_task.dart';
import 'package:todoliteup/injection_container.dart';
import 'package:todoliteup/models/task.dart';

class TaskController extends GetxController with StateMixin<List<MTask>> {
  final int? type;

  TaskController.all() : type = null;
  TaskController.doing() : type = MTask.ST_DOING;
  TaskController.done() : type = MTask.ST_DONE;

  GetTasks get _getTasks => sl();
  UpdateTask get _updateTask => sl();
  DeleteTask get _deleteTask => sl();

  getList() async {
    change(null, status: RxStatus.loading());
    List<MTask> tasks = [];
    switch(type) {
      case null:
        final data = await _getTasks(null);
        tasks = data.fold((l) => null, (r) => r) ?? [];
        break;
      case MTask.ST_DOING:
        final data = await _getTasks(MTask.ST_DOING);
        tasks = data.fold((l) => null, (r) => r) ?? [];
        break;
      case MTask.ST_DONE:
        final data = await _getTasks(MTask.ST_DONE);
        tasks = data.fold((l) => null, (r) => r) ?? [];
        break;
    }
    if (tasks.isEmpty) change(tasks, status: RxStatus.empty());
    else change(tasks, status: RxStatus.success());
  }

  deleteTask(MTask task) async {
    await _deleteTask(task.id);
    getList();
  }

  updateTask(MTask task) async {
    await _updateTask(task);
    getList();
  }

  changeStatus(MTask task, int status) async {
    updateTask(MTask(
      id: task.id,
      title: task.title,
      description: task.description,
      status: status,
    ));
  }

}

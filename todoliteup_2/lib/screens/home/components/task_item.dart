import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:todoliteup/models/task.dart';
import 'package:todoliteup/res/strings.dart';

class TaskItem extends StatelessWidget {
  final MTask task;
  final Function(int status)? onStatusChanged;
  final Function? onDelete;

  const TaskItem({
    super.key,
    required this.task,
    this.onStatusChanged,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ExpandablePanel(
        header: ListTile(
          leading: Container(
            width: 4,
            height: 24,
            color: task.status == MTask.stDoing ? Colors.grey : Colors.green,
          ),
          title: Text(
            task.title,
            style: TextStyle(
              decoration: task.status == MTask.stDone
                  ? TextDecoration.lineThrough
                  : null,
            ),
          ),
        ),
        collapsed: const SizedBox(),
        expanded: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ListTile(
              title: Text(
                task.description,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontSize: 14,
                      decoration: task.status == MTask.stDone
                          ? TextDecoration.lineThrough
                          : null,
                    ),
              ),
              trailing: IconButton(
                icon: Icon(
                  task.status == MTask.stDoing
                      ? Icons.check_circle_outline
                      : Icons.check_circle,
                ),
                color:
                    task.status == MTask.stDoing ? Colors.grey : Colors.green,
                onPressed: _onPressed,
              ),
            ),
            Divider(
              color: task.status == MTask.stDoing ? Colors.grey : Colors.green,
            ),
            Wrap(
              children: [
                if (task.image != null)
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, bottom: 8.0),
                    child: ClipOval(
                      child: Image.network(
                        task.image!,
                        width: 48,
                        height: 48,
                      ),
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, bottom: 8.0),
                  child: OutlinedButton(
                    onPressed: () => onDelete?.call(),
                    child: const Text(
                      StringRes.delete,
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ),
                if (task.status == MTask.stDoing)
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, bottom: 8.0),
                    child: ElevatedButton.icon(
                      onPressed: _onPressed,
                      label: const Text(
                        StringRes.done,
                      ),
                      icon: const Icon(Icons.check_box),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _onPressed() {
    if (null != onStatusChanged) {
      onStatusChanged!(
        task.status == MTask.stDoing ? MTask.stDone : MTask.stDoing,
      );
    }
  }
}

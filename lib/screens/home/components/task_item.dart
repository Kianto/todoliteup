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
            color: task.status == MTask.ST_DOING
                ? Colors.grey
                : Colors.green,
          ),
          title: Text(
            task.title,
            style: TextStyle(
              decoration: task.status == MTask.ST_DONE
                  ? TextDecoration.lineThrough
                  : null,
            ),
          ),
        ),
        collapsed: const SizedBox(),
        expanded: Column(
          children: [
            ListTile(
              title: Text(
                task.description,
                style: Theme.of(context).textTheme.caption?.copyWith(
                  fontSize: 14,
                  decoration: task.status == MTask.ST_DONE
                      ? TextDecoration.lineThrough
                      : null,
                ),
              ),
              trailing: IconButton(
                icon: Icon(
                  task.status == MTask.ST_DOING
                      ? Icons.check_circle_outline
                      : Icons.check_circle,
                ),
                color: task.status == MTask.ST_DOING
                    ? Colors.grey
                    : Colors.green,
                onPressed: _onPressed,
              ),
            ),
            Divider(
              color: task.status == MTask.ST_DOING
                  ? Colors.grey
                  : Colors.green,
            ),
            Row(
              children: [
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

  _onPressed() {
    if (null != onStatusChanged) {
      onStatusChanged!(
          task.status == MTask.ST_DOING ? MTask.ST_DONE : MTask.ST_DOING
      );
    }
  }

}
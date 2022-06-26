import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:todoliteup/models/task.dart';

class TaskItem extends StatelessWidget {
  final Task task;
  final Function(int status)? onStatusChanged;

  TaskItem({required this.task, this.onStatusChanged,});

  @override
  Widget build(BuildContext context) {
    return ExpandablePanel(
      header: ListTile(
        title: Text('${task.title}'),
      ),
      collapsed: SizedBox(),
      expanded: ListTile(
        title: Text(
          '${task.description}',
          style: Theme.of(context).textTheme.caption,
        ),
        trailing: IconButton(
          icon: Icon(
            task.status == Task.DOING_STATUS
                ? Icons.check_circle_outline
                : Icons.check_circle,
          ),
          color: task.status == Task.DOING_STATUS
              ? Colors.blue
              : Colors.green,
          onPressed: _onPressed,
        ),
      ),
    );
  }

  _onPressed() {
    if (null != onStatusChanged) {
      onStatusChanged!(
          task.status == Task.DOING_STATUS ? Task.DONE_STATUS : Task.DOING_STATUS
      );
    }
  }

}
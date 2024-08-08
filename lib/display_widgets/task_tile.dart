import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/task_model.dart';
import '../providers/task_provider.dart';

class TaskTile extends ConsumerWidget {
  final TaskModel task;

  TaskTile({required this.task});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      title: Text(
        task.title,
        style: TextStyle(
          decoration: task.isDone ? TextDecoration.lineThrough : null,
        ),
      ),
      leading: Checkbox(
        value: task.isDone,
        onChanged: (bool? value) {
          if (value != null) {
            ref.read(taskProvider.notifier).toggleTaskDone(task.id);
          }
        },
      ),
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: () {
          ref.read(taskProvider.notifier).deleteTask(task.id);
        },
      ),
    );
  }
}

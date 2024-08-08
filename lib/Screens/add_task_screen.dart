import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/task_model.dart';
import '../providers/task_provider.dart';

class AddTaskScreen extends ConsumerWidget {
  final TextEditingController _taskController = TextEditingController();
  final TextEditingController _titleController= TextEditingController();
  void _addTask(BuildContext context, WidgetRef ref) {
    final taskText = _taskController.text;
    final taskTitle=_titleController.text;
    if (taskText.isNotEmpty) {
      final id = DateTime.now().toString();
      final task = TaskModel(
        id: id,
        title: taskText,
        isDone: false,
      );
      // Call the addTask method with both the task and its ID
      ref.read(taskProvider.notifier).addTask(task, id);

      // Navigate back to the previous screen
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Task'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: _taskController,
              decoration: const InputDecoration(labelText: 'Task'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _addTask(context, ref),
              child: const Text('Add Task'),
            ),
          ],
        ),
      ),
    );
  }
}

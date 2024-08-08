import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do_list/models/task_model.dart';
import '../models/task_model.dart';

final taskProvider = StateNotifierProvider<TaskNotifier, List<TaskModel>>((ref) => TaskNotifier());

class TaskNotifier extends StateNotifier<List<TaskModel>> {
  TaskNotifier() : super([]) {
    _fetchTasks();
  }

  Future<void> _fetchTasks() async {
    final snapshot = await FirebaseFirestore.instance.collection('tasks').get();
    state = snapshot.docs.map((doc) => TaskModel.fromMap(doc.data())).toList();
  }

  void addTask(TaskModel task, String id) async {
    try {
      // Add or update the task in Firestore with the specified ID
      await FirebaseFirestore.instance.collection('tasks').doc(id).set(task.toMap());
      state = [...state, task];
    } catch (e) {

      print('Error adding task: $e');
    }
  }


  void deleteTask(String id) async {
    await FirebaseFirestore.instance.collection('tasks').doc(id).delete();
    state = state.where((task) => task.id != id).toList();
  }
  void updateTask(TaskModel updatedTask) {
    state = [
      for (final task in state)
        if (task.id == updatedTask.id) updatedTask else task,
    ];
  }

  void toggleTaskDone(String id) async {
    final task = state.firstWhere((task) => task.id == id);
    final updatedTask = TaskModel(id: task.id, title: task.title, isDone: !task.isDone);
    await FirebaseFirestore.instance.collection('tasks').doc(id).update(updatedTask.toMap());
    state = state.map((task) => task.id == id ? updatedTask : task).toList();
  }
}

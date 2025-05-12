import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_manager/model/task_model.dart';
import 'package:task_manager/repository/task_repository.dart';
import 'package:uuid/uuid.dart';

import '../utils/utils.dart';

class TaskViewModel extends ChangeNotifier {
  final TaskRepository _repository = TaskRepository();
  final List<Task> _tasks = [];

  List<Task> get tasks => _tasks;

  TaskViewModel() {
    loadTasks();
  }

  void loadTasks() async {
    final loadedTasks = await _repository.loadTasks();
    _tasks.addAll(loadedTasks);
    notifyListeners();
  }

  void addTask(String title, BuildContext context) {
    // Validate if the title is empty
    if (title.isEmpty) {
      Utils.toastMessage('Must Add a Title');
      return; // Do not proceed with adding the task if the title is empty
    }

    final newTask = Task(id: const Uuid().v4(), title: title);
    _tasks.add(newTask);
    _repository.saveTasks(_tasks); // Save the tasks in the repository
    notifyListeners(); // Notify listeners to update the UI
  }

  Future<void> saveTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final encodedTasks =
    _tasks.map((task) => json.encode(task.toMap())).toList();
    await prefs.setStringList('tasks', encodedTasks);
  }

  void deleteTask(String id) {
    _tasks.removeWhere((task) => task.id == id);
    _repository.saveTasks(_tasks);
    notifyListeners();
  }

  void toggleCompletion(String id) {
    final index = _tasks.indexWhere((task) => task.id == id);
    if (index != -1) {
      _tasks[index].isCompleted = !_tasks[index].isCompleted;
      _repository.saveTasks(_tasks);
      notifyListeners();
    }
  }
  void updateTaskDetails(String id, String newDetails) {
    final index = _tasks.indexWhere((task) => task.id == id);
    if (index != -1) {
      _tasks[index].details = newDetails;
      saveTasks();
      notifyListeners();
    }
  }
}

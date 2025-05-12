import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_manager/model/task_model.dart';

class TaskRepository {
  static const String _key = 'tasks';

  Future<List<Task>> loadTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final String? data = prefs.getString(_key);
    if (data != null) {
      List<dynamic> decoded = jsonDecode(data);
      return decoded.map((item) => Task.fromMap(item)).toList();
    }
    return [];
  }

  Future<void> saveTasks(List<Task> tasks) async {
    final prefs = await SharedPreferences.getInstance();
    final encoded = jsonEncode(tasks.map((t) => t.toMap()).toList());
    await prefs.setString(_key, encoded);
  }
}

import 'package:flutter/material.dart';

class TaskState extends ChangeNotifier {
  final ValueNotifier<List<String>> tasks = ValueNotifier([]);

  void addTask(String task) {
    if (task.isNotEmpty) {
      tasks.value.add(task);
      tasks.notifyListeners();
      print(tasks);
    }
  }

  void removeTask(String task) {
    tasks.value.remove(task);
    tasks.notifyListeners();
  }
}

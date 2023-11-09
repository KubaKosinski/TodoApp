import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:my_app/models/task.dart';

class TaskState extends ChangeNotifier {
  final box = Hive.box('myBox');

  void addTask(Task task, String controller) {
    if (controller.isNotEmpty) {
      box.add(task);
      notifyListeners();
    }
  }

  void removeTask(Task task) {
    box.delete(task);
  }
}

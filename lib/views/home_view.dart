import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:my_app/models/task.dart';

import '../state/task_state.dart';
import '../widgets/tasks_list.dart';

class HomeView extends StatefulWidget {
  HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TaskState taskState = TaskState();

  TextEditingController taskController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(controller: taskController),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                final task = Task(taskController.text);
                taskState.addTask(
                  task,
                  taskController.text,
                );
                taskController.clear();
                print(taskState.box.values);
              },
              child: const Text(
                'Add',
              ),
            ),
            const SizedBox(height: 32),
            TasksList(taskState: taskState),
          ],
        ),
      ),
    );
  }
}

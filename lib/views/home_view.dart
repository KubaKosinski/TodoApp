import 'package:flutter/material.dart';

import '../state/task_state.dart';
import '../widgets/tasks_list.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final TaskState taskState = TaskState();

  @override
  Widget build(BuildContext context) {
    TextEditingController taskController = TextEditingController();
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(controller: taskController),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                taskState.addTask(taskController.text);
                taskController.clear();
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

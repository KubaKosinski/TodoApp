import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../state/task_state.dart';

class TasksList extends StatelessWidget {
  const TasksList({
    super.key,
    required this.taskState,
  });
  final TaskState taskState;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<List<String>>(
      valueListenable: taskState.tasks,
      builder: (context, value, _) {
        return value.isEmpty
            ? const Center(
                child: Text("Add some tasks"),
              )
            : ListView.builder(
                shrinkWrap: true,
                itemCount: value.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 10,
                    ),
                    color: Colors.blue,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          value[index],
                        ),
                        IconButton(
                          onPressed: () {
                            taskState.removeTask(value[index]);
                          },
                          icon: const Icon(
                            Icons.delete,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
      },
    );
  }
}

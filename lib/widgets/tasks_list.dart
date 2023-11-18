import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:my_app/models/note.dart';

import '../state/note_state.dart';

class TasksList extends StatelessWidget {
  const TasksList({
    super.key,
    required this.taskState,
  });
  final NoteState taskState;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: taskState.box.listenable(),
      builder: (context, value, _) {
        return value.isEmpty
            ? const Center(
                child: Text("No notes"),
              )
            : Padding(
                padding: const EdgeInsets.all(16),
                child: ListView.separated(
                  separatorBuilder: (_, __) => const SizedBox(height: 16),
                  shrinkWrap: true,
                  itemCount: value.length,
                  itemBuilder: (context, index) {
                    final note = value.getAt(index) as Note;
                    return ListTile(
                      title: Text(
                        note.title,
                      ),
                      subtitle: const Text("12:05 PM"),
                      tileColor: const Color.fromARGB(255, 29, 29, 29),
                    );
                  },
                ),
              );
      },
    );
  }
}

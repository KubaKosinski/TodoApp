import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:my_app/models/note.dart';
import 'package:my_app/utils/extensions/date_time_extension.dart';

import '../state/note_state.dart';

class TasksList extends StatelessWidget {
  const TasksList({
    super.key,
    required this.noteState,
  });
  final NoteState noteState;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: noteState.box.listenable(),
      builder: (context, value, _) {
        return value.isEmpty
            ? const Center(
                child: Text("No notes"),
              )
            : ListView.separated(
                separatorBuilder: (_, __) => const SizedBox(height: 16),
                shrinkWrap: true,
                itemCount: value.length,
                itemBuilder: (context, index) {
                  final note = value.getAt(index) as Note;
                  return Dismissible(
                    key: ValueKey(note),
                    onDismissed: (direction) {
                      noteState.removeNote(index);
                    },
                    child: ListTile(
                      title: Text(
                        note.title,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        note.dateTime.formatDate(),
                      ),
                      tileColor: const Color.fromARGB(255, 29, 29, 29),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  );
                },
              );
      },
    );
  }
}

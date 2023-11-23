import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:my_app/res/strings/app_strings.dart';

import '../state/note_state.dart';
import 'notes_list_view.dart';

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
                child: Text(AppStrings.noNotes),
              )
            : NotesListView(
                noteState: noteState,
                value: value,
              );
      },
    );
  }
}

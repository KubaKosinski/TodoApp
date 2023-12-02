import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:my_app/res/strings/app_strings.dart';
import 'package:provider/provider.dart';

import '../state/note_state.dart';
import 'notes_list_view.dart';

class TasksList extends StatelessWidget {
  const TasksList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<NoteState>(
      builder: (context, notes, child) {
        return notes.getNotes().isEmpty
            ? const Center(
                child: Text(AppStrings.noNotes),
              )
            : NotesListView(
                notes: notes.getNotes(),
              );
      },
    );
  }
}

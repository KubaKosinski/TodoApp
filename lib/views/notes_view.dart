import 'package:flutter/material.dart';
import 'package:my_app/state/note_state.dart';
import 'package:my_app/widgets/tasks_list.dart';

import '../widgets/add_note_floating_button.dart';

class NotesView extends StatelessWidget {
  const NotesView({
    super.key,
    required this.noteState,
  });

  final NoteState noteState;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 24,
        ),
        child: TasksList(
          noteState: noteState,
        ),
      ),
      floatingActionButton: AddNoteFloatingButton(noteState: noteState),
    );
  }
}

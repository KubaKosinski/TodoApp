import 'package:flutter/material.dart';
import 'package:my_app/view_model/note_state.dart';
import 'package:my_app/widgets/tasks_list.dart';
import 'package:provider/provider.dart';
import '../models/note.dart';
import '../widgets/add_note_floating_button.dart';

class NotesView extends StatelessWidget {
  const NotesView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<NoteViewModel>(
      builder: (context, value, child) {
        print(value.getNotes);
        final note = Note.empty();
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 24,
            ),
            child: TasksList(
              notes: value.getNotes,
            ),
          ),
          floatingActionButton: AddNoteFloatingButton(note: note),
        );
      },
    );
  }
}

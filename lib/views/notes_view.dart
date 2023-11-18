import 'package:flutter/material.dart';
import 'package:my_app/state/note_state.dart';
import 'package:my_app/views/add_note_view.dart';
import 'package:my_app/widgets/tasks_list.dart';

class NotesView extends StatelessWidget {
  const NotesView({
    super.key,
    required this.taskState,
  });

  final NoteState taskState;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TasksList(
        taskState: taskState,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const AddNoteView(),
            ),
          );
        },
        child: const Text("Add"),
      ),
    );
  }
}

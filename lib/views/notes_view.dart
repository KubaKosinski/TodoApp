import 'package:flutter/material.dart';
import 'package:my_app/res/colors/app_color.dart';
import 'package:my_app/state/note_state.dart';
import 'package:my_app/views/add_note_view.dart';
import 'package:my_app/widgets/tasks_list.dart';

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
          horizontal: 16,
          vertical: 24,
        ),
        child: TasksList(
          noteState: noteState,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const AddNoteView(),
            ),
          );
        },
        backgroundColor: AppColor.primaryColor,
        shape: const CircleBorder(),
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 35,
        ),
      ),
    );
  }
}

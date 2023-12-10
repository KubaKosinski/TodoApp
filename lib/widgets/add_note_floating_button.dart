// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/note.dart';
import '../res/colors/app_color.dart';
import '../state/note_state.dart';
import '../views/add_or_update_note_view.dart';

class AddNoteFloatingButton extends StatelessWidget {
  const AddNoteFloatingButton({
    Key? key,
    required this.note,
  }) : super(key: key);

  final Note note;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async {
        await context.read<NoteState>().updateNote(
              note: note,
              id: note.id,
            );
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => AddOrUpdateNoteView(note: note),
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
    );
  }
}

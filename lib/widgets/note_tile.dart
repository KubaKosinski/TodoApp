import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/note.dart';
import '../res/colors/app_color.dart';
import '../state/note_state.dart';
import '../views/add_or_update_note_view.dart';

class NoteTile extends StatelessWidget {
  const NoteTile({
    super.key,
    required this.note,
    required this.noteState,
    required this.index,
  });

  final Note note;
  final NoteState noteState;
  final int index;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => AddOrUpdateNoteView(
            noteState: noteState,
            note: note,
            index: index,
          ),
        ),
      ),
      title: Text(
        note.title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        DateFormat.yMMMMd().add_jm().format(note.dateTime).toString(),
      ),
      tileColor: AppColor.contrastColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }
}

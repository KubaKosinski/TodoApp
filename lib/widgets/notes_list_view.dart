import 'package:flutter/material.dart';

import '../models/note.dart';
import '../state/note_state.dart';
import 'note_tile.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({
    super.key,
    required this.noteState,
    required this.value,
  });

  final NoteState noteState;
  final dynamic value;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (_, __) => const SizedBox(height: 16),
      shrinkWrap: true,
      itemCount: value.length,
      itemBuilder: (context, index) {
        final note = value.getAt(index) as Note;
        return Dismissible(
          key: ValueKey(note),
          onDismissed: (_) => noteState.removeNote(index),
          child: NoteTile(
            note: note,
            noteState: noteState,
            index: index,
          ),
        );
      },
    );
  }
}

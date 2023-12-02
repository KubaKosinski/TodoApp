// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:my_app/state/note_state.dart';
import 'package:provider/provider.dart';

import '../models/note.dart';
import 'note_tile.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({
    Key? key,
    required this.notes,
  }) : super(key: key);

  final List<Note> notes;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (_, __) => const SizedBox(height: 16),
      shrinkWrap: true,
      itemCount: notes.length,
      itemBuilder: (context, index) {
        final note = notes[index];
        return Dismissible(
          key: ValueKey(note),
          onDismissed: (_) async =>
              await context.read<NoteState>().removeNote(index: index),
          child: NoteTile(
            note: note,
            index: index,
          ),
        );
      },
    );
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:my_app/view_model/note_view_model.dart';
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
          key: ValueKey(note.id),
          onDismissed: (_) async =>
              await context.read<NoteViewModel>().removeNote(id: note.id),
          child: NoteTile(
            note: note,
          ),
        );
      },
    );
  }
}

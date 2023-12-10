// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';

import 'package:my_app/res/strings/app_strings.dart';

import '../models/note.dart';
import '../state/note_state.dart';
import 'notes_list_view.dart';

class TasksList extends StatelessWidget {
  const TasksList({
    Key? key,
    required this.notes,
  }) : super(key: key);

  final List<Note> notes;

  @override
  Widget build(BuildContext context) {
    return notes.isEmpty
        ? const Center(
            child: Text(AppStrings.noNotes),
          )
        : NotesListView(
            notes: notes,
          );
  }
}

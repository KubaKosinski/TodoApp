import 'package:flutter/material.dart';
import 'package:my_app/models/note.dart';
import '../state/note_state.dart';

class AddNoteView extends StatefulWidget {
  const AddNoteView({super.key});

  @override
  State<AddNoteView> createState() => _AddNoteViewState();
}

class _AddNoteViewState extends State<AddNoteView> {
  final NoteState noteState = NoteState();

  late final TextEditingController noteController = TextEditingController();

  Note? note;

  @override
  void initState() {
    noteController.addListener(() {
      note = Note(
        title: noteController.text,
        dateTime: DateTime.now(),
      );
    });
    super.initState();
  }

  @override
  void dispose() {
    if (noteController.text.isNotEmpty) {
      noteState.addNote(note!);
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Notes"),
          backgroundColor: Colors.transparent,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: TextField(
            controller: noteController,
            maxLines: 15,
            autofocus: true,
            decoration: const InputDecoration(
              border: InputBorder.none,
            ),
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

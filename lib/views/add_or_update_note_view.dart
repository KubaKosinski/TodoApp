import 'package:flutter/material.dart';
import 'package:my_app/models/note.dart';
import 'package:my_app/res/strings/app_strings.dart';
import '../state/note_state.dart';

class AddOrUpdateNoteView extends StatefulWidget {
  const AddOrUpdateNoteView({
    super.key,
    this.note,
    this.index,
    required this.noteState,
  });

  final Note? note;
  final int? index;
  final NoteState noteState;

  @override
  State<AddOrUpdateNoteView> createState() => _AddOrUpdateNoteViewState();
}

class _AddOrUpdateNoteViewState extends State<AddOrUpdateNoteView> {
  late final TextEditingController noteController;
  Note? note;

  void saveNote() async {
    if (noteController.text.isNotEmpty) {
      if (widget.note == null) {
        await widget.noteState.addNote(note!);
      } else {
        await widget.noteState.updateNote(widget.index!, note!);
      }
    }
  }

  @override
  void initState() {
    noteController = TextEditingController(text: widget.note?.title);
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
    saveNote();
    noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.notes),
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

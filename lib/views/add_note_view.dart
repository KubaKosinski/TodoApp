import 'package:flutter/material.dart';
import 'package:my_app/models/note.dart';
import '../state/note_state.dart';

class AddNoteView extends StatefulWidget {
  const AddNoteView({super.key});

  @override
  State<AddNoteView> createState() => _AddNoteViewState();
}

class _AddNoteViewState extends State<AddNoteView> {
  final NoteState taskState = NoteState();

  late final TextEditingController taskController = TextEditingController();

  Note? task;

  @override
  void initState() {
    taskController.addListener(() {
      task = Note(taskController.text);
    });
    super.initState();
  }

  @override
  void dispose() {
    if (taskController.text.isNotEmpty) {
      taskState.addNote(task!);
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
            controller: taskController,
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

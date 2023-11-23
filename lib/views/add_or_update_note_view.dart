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
  late final TextEditingController titleController;
  late final TextEditingController descriptionController;

  Note? note;

  void saveNote() async {
    if (titleController.text.isNotEmpty) {
      if (widget.note == null) {
        await widget.noteState.addNote(note!);
      } else {
        await widget.noteState.updateNote(widget.index!, note!);
      }
    }
  }

  @override
  void initState() {
    titleController = TextEditingController(text: widget.note?.title);
    descriptionController =
        TextEditingController(text: widget.note?.description);
    titleController.addListener(() {
      note = Note(
        title: titleController.text,
        description: descriptionController.text,
        dateTime: DateTime.now(),
      );
    });
    descriptionController.addListener(() {
      note = Note(
        title: titleController.text,
        description: descriptionController.text,
        dateTime: DateTime.now(),
      );
    });
    super.initState();
  }

  @override
  void dispose() {
    saveNote();
    titleController.dispose();
    descriptionController.dispose();
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
          child: Column(
            children: [
              TextField(
                controller: titleController,
                maxLines: 1,
                autofocus: true,
                decoration: const InputDecoration(
                  hintText: "Title",
                  border: InputBorder.none,
                ),
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              TextField(
                controller: descriptionController,
                maxLines: 15,
                autofocus: true,
                decoration: const InputDecoration(
                  hintText: "Description",
                  border: InputBorder.none,
                ),
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

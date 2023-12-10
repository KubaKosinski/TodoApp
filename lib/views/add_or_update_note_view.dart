import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_app/models/note.dart';
import 'package:my_app/res/strings/app_strings.dart';
import 'package:provider/provider.dart';
import '../view_model/note_state.dart';

class AddOrUpdateNoteView extends StatefulWidget {
  const AddOrUpdateNoteView({
    super.key,
    required this.note,
  });

  final Note note;

  @override
  State<AddOrUpdateNoteView> createState() => _AddOrUpdateNoteViewState();
}

class _AddOrUpdateNoteViewState extends State<AddOrUpdateNoteView> {
  late final TextEditingController titleController;
  late final TextEditingController descriptionController;

  void updateNote() async {
    final note = widget.note.copyWith(
      title: titleController.text,
      description: descriptionController.text,
      dateTime: DateTime.now(),
    );

    // validation only
    if (titleController.text == widget.note.title &&
        descriptionController.text == widget.note.description) {
      return;
    }

    if (titleController.text.isNotEmpty) {
      await context.read<NoteViewModel>().updateNote(
            id: widget.note.id,
            note: note,
          );
    }
  }

  @override
  void initState() {
    titleController = TextEditingController(text: widget.note.title);
    descriptionController =
        TextEditingController(text: widget.note.description);
    titleController.addListener(updateNote);
    descriptionController.addListener(updateNote);
    print(widget.note.id);
    super.initState();
  }

  @override
  void dispose() {
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
          actions: [
            Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: Row(
                  children: [
                    Icon(
                      widget.note.showDescription
                          ? Icons.speaker_notes
                          : Icons.speaker_notes_off,
                    ),
                    const SizedBox(width: 3),
                    Checkbox(
                      value: widget.note.showDescription,
                      onChanged: (bool? value) {
                        setState(
                          () {
                            final xd = widget.note.showDescription = value!;
                            context.read<NoteViewModel>().updateNote(
                                  id: widget.note.id,
                                  note: widget.note.copyWith(
                                    title: titleController.text,
                                    description: descriptionController.text,
                                    dateTime: DateTime.now(),
                                    showDescription: xd,
                                  ),
                                );
                          },
                        );
                        print(widget.note);
                      },
                    ),
                  ],
                ))
          ],
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
              Flexible(
                child: TextField(
                  controller: descriptionController,
                  maxLines: 15,
                  decoration: const InputDecoration(
                    hintText: "Description",
                    border: InputBorder.none,
                  ),
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Spacer(),
              Text(
                'Last edit ${DateFormat.yMMMMd().add_jm().format(widget.note.dateTime)}',
                style: const TextStyle(
                  fontSize: 11,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:intl/intl.dart';
import 'package:my_app/models/note.dart';
import 'package:my_app/res/colors/app_color.dart';
import 'package:my_app/res/strings/app_strings.dart';
import 'package:my_app/utils/extensions/date_time_extension.dart';
import 'package:my_app/views/add_or_update_note_view.dart';

import '../state/note_state.dart';

class TasksList extends StatelessWidget {
  const TasksList({
    super.key,
    required this.noteState,
  });
  final NoteState noteState;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: noteState.box.listenable(),
      builder: (context, value, _) {
        return value.isEmpty
            ? const Center(
                child: Text(AppStrings.noNotes),
              )
            : ListView.separated(
                separatorBuilder: (_, __) => const SizedBox(height: 16),
                shrinkWrap: true,
                itemCount: value.length,
                itemBuilder: (context, index) {
                  final note = value.getAt(index) as Note;
                  return Dismissible(
                    key: ValueKey(note),
                    onDismissed: (direction) async =>
                        await noteState.removeNote(index),
                    child: ListTile(
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
                        DateFormat.yMMMMd().add_jm().format(note.dateTime),
                      ),
                      tileColor: AppColor.contrastColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  );
                },
              );
      },
    );
  }
}

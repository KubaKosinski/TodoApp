import 'package:flutter/material.dart';

import '../res/colors/app_color.dart';
import '../state/note_state.dart';
import '../views/add_or_update_note_view.dart';

class AddNoteFloatingButton extends StatelessWidget {
  const AddNoteFloatingButton({
    super.key,
    required this.noteState,
  });

  final NoteState noteState;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const AddOrUpdateNoteView(),
          ),
        );
      },
      backgroundColor: AppColor.primaryColor,
      shape: const CircleBorder(),
      child: const Icon(
        Icons.add,
        color: Colors.white,
        size: 35,
      ),
    );
  }
}

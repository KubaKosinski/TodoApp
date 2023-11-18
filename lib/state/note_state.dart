import 'package:hive/hive.dart';
import 'package:my_app/models/note.dart';

class NoteState {
  final box = Hive.box('myBox');

  void addNote(Note note) {
    box.add(note);
  }

  void removeNote(int index) {
    box.deleteAt(index);
  }
}

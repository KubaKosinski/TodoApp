import 'package:hive/hive.dart';
import 'package:my_app/models/note.dart';

class NoteState {
  final box = Hive.box('notes');

  Future<void> addNote(Note note) async {
    await box.add(note);
  }

  Future<void> removeNote(int index) async {
    await box.deleteAt(index);
  }

  Future<void> updateNote(int index, Note note) async {
    await box.putAt(index, note);
  }

  Future<void> showDescription(int index, bool value, Note note) async {
    final newNote = note.copyWith(showDescription: value);
    await box.putAt(index, newNote);
  }
}

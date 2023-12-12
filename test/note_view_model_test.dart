import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_app/models/note.dart';
import 'package:my_app/repository/note_repository.dart';
import 'package:my_app/repository/note_repository_impl.dart';
import 'package:my_app/view_model/note_view_model.dart';

void main() {
  late NoteViewModel sut;
  late NoteRepository mockNoteRepository;

  setUp(() async {
    Hive.init('notes');
    Hive.registerAdapter(NoteAdapter());
    await Hive.openBox('notes');
    mockNoteRepository = NoteRepositoryImpl();
    sut = NoteViewModel(noteRepository: mockNoteRepository);
  });

  test("Initial list is empty", () {
    expect(sut.getNotes, []);
  });

  test('Manage note', () {
    Hive.box('notes').clear();
    final note = Note(
      title: '1',
      dateTime: DateTime.utc(1969),
      id: '1000',
    );
    sut.updateNote(note: note, id: note.id);

    final updatedNote = note.copyWith(title: '2');

    sut.updateNote(note: updatedNote, id: note.id);
    Hive.box('notes').clear();
    expect(sut.getNotes.first, updatedNote);
  });
}

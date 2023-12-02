import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_app/repository/note_repository.dart';

import '../models/note.dart';

class NoteRepositoryImpl implements NoteRepository<Note> {
  final _box = Hive.box('notes');
  @override
  Future<void> addNote({required Note entity}) async {
    await _box.add(entity);
  }

  @override
  Future<void> removeNote({required int index}) async {
    await _box.deleteAt(index);
  }

  @override
  Future<void> updateNote({required Note entity, required int index}) async {
    await _box.putAt(index, entity);
  }

  @override
  List<Note> getNotes() {
    return _box.values.toList().cast<Note>();
  }
}

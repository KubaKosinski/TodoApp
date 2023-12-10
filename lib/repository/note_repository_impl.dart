import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_app/repository/note_repository.dart';

import '../models/note.dart';

class NoteRepositoryImpl implements NoteRepository<Note> {
  final _box = Hive.box('notes');
  @override
  Future<void> addNote({required Note entity}) async => await _box.add(entity);

  @override
  Future<void> removeNote({required String id}) async => await _box.delete(id);

  @override
  Future<void> updateNote({
    required Note entity,
    required String id,
  }) async =>
      await _box.put(
        id,
        entity,
      );

  @override
  List<Note> get getNotes => _box.values.toList().cast<Note>();
}

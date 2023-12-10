// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../models/note.dart';
import '../repository/note_repository.dart';

class NoteState extends ChangeNotifier {
  final NoteRepository _noteRepository;
  NoteState({
    required NoteRepository noteRepository,
  }) : _noteRepository = noteRepository;

  List<Note> get getNotes => _noteRepository.getNotes as List<Note>;

  Future<void> addNote({required Note note}) async {
    await _noteRepository.addNote(entity: note);
    notifyListeners();
  }

  Future<void> updateNote({
    required Note note,
    required String id,
  }) async {
    await _noteRepository.updateNote(
      entity: note,
      id: id,
    );
    notifyListeners();
  }

  Future<void> removeNote({required String id}) async {
    await _noteRepository.removeNote(id: id);
    notifyListeners();
  }
}

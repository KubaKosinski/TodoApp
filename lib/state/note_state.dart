// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:my_app/repository/note_repository_impl.dart';

import '../models/note.dart';

class NoteState extends ChangeNotifier {
  final NoteRepositoryImpl _noteRepository;
  NoteState({
    required NoteRepositoryImpl noteRepository,
  }) : _noteRepository = noteRepository;

  List<Note> getNotes() => _noteRepository.getNotes();

  Future<void> addNote({required Note note}) async {
    await _noteRepository.addNote(entity: note);
    notifyListeners();
  }

  Future<void> updateNote({
    required Note note,
    required int index,
  }) async {
    await _noteRepository.updateNote(
      entity: note,
      index: index,
    );
    notifyListeners();
  }

  Future<void> removeNote({required int index}) async {
    await _noteRepository.removeNote(index: index);
    notifyListeners();
  }
}

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:my_app/models/note.dart';

class NoteState extends ChangeNotifier {
  final box = Hive.box('myBox');

  void addNote(Note task) {
    box.add(task);
  }

  void removeNote(int index) {
    box.deleteAt(index);
  }
}

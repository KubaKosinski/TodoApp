// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:hive/hive.dart';

part 'note.g.dart';

@HiveType(typeId: 0)
class Note {
  @HiveField(0)
  String title;
  @HiveField(1)
  String? description;
  @HiveField(2)
  DateTime dateTime;
  @HiveField(3)
  bool showDescription = true;

  Note({
    required this.title,
    this.description,
    required this.dateTime,
    this.showDescription = true,
  });

  @override
  String toString() {
    return 'Note(title: $title, description: $description, dateTime: $dateTime, showDescription: $showDescription)';
  }

  @override
  bool operator ==(covariant Note other) {
    if (identical(this, other)) return true;

    return other.title == title &&
        other.description == description &&
        other.dateTime == dateTime &&
        other.showDescription == showDescription;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        description.hashCode ^
        dateTime.hashCode ^
        showDescription.hashCode;
  }

  Note copyWith({
    String? title,
    String? description,
    DateTime? dateTime,
    bool? showDescription,
  }) {
    return Note(
      title: title ?? this.title,
      description: description ?? this.description,
      dateTime: dateTime ?? this.dateTime,
      showDescription: showDescription ?? this.showDescription,
    );
  }
}

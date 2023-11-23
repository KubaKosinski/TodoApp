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

  Note({
    required this.title,
    this.description,
    required this.dateTime,
  });
}

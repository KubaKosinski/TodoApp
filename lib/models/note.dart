import 'package:hive/hive.dart';

part 'note.g.dart';

@HiveType(typeId: 0)
class Note {
  @HiveField(0)
  String title;
  @HiveField(1)
  DateTime dateTime;

  Note({
    required this.title,
    required this.dateTime,
  });
}

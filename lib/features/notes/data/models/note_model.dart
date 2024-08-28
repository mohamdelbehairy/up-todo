import 'package:hive/hive.dart';

part 'note_model.g.dart';

@HiveType(typeId: 0)
class NoteModel {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String body;
  @HiveField(2)
  final bool isFavourite;

  NoteModel(
      {required this.title, required this.body, this.isFavourite = false});
}

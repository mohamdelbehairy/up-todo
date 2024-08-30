import 'package:up_todo/features/notes/data/models/note_model.dart';

abstract class GetNotesRepo {
  List<NoteModel> getNotes(String boxName);
  Map<dynamic, NoteModel> getNotesToMap(String boxName);
}

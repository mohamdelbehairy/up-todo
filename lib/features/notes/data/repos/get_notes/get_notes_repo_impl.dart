import 'package:hive/hive.dart';
import 'package:up_todo/features/notes/data/models/note_model.dart';
import 'package:up_todo/features/notes/data/repos/get_notes/get_notes_repo.dart';

class GetNotesRepoImpl extends GetNotesRepo {
  @override
  List<NoteModel> getNotes(String boxName) {
    var notes = Hive.box<NoteModel>(boxName);
    return notes.values.toList();
  }

  @override
  Map<dynamic, NoteModel> getNotesToMap(String boxName) {
    var box = Hive.box<NoteModel>(boxName);
    return box.toMap();
  }
}

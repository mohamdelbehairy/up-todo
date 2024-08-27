import 'package:hive/hive.dart';
import 'package:up_todo/features/notes/data/models/note_model.dart';

List<NoteModel> getNotesMethod(String boxName) {
    var notes = Hive.box<NoteModel>(boxName);
    return notes.values.toList();
  }
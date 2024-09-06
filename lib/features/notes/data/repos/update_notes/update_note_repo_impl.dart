import 'package:hive/hive.dart';
import 'package:up_todo/features/notes/data/models/note_model.dart';

import 'update_note_repo.dart';

class UpdateNoteRepoImpl extends UpdateNoteRepo {
  @override
  Future<void> updateNotesWithIndex(
      {required int index,
      required String boxName,
      required NoteModel noteModel}) async {
    var box = Hive.box<NoteModel>(boxName);
    await box.putAt(index, noteModel);
  }

  @override
  Future<void> updateNotesWithKey(
      {required key,
      required String boxName,
      required NoteModel noteModel}) async {
    var box = Hive.box<NoteModel>(boxName);
    await box.put(key, noteModel);
  }
}

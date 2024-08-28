import 'package:hive/hive.dart';
import 'package:up_todo/features/notes/data/models/note_model.dart';

import 'update_note_repo.dart';

class UpdateNoteRepoImpl extends UpdateNoteRepo {
  @override
  Future<void> updateNotes(
      {required int index,
      required String boxName,
      required NoteModel noteModel}) async {
    var box = Hive.box<NoteModel>(boxName);
    await box.putAt(index, noteModel);
  }
}

import 'package:hive/hive.dart';
import 'package:up_todo/features/notes/data/models/note_model.dart';

import 'remove_note_repo.dart';

class RemoveNoteRepoImpl extends RemoveNoteRepo {
  @override
  Future<void> removeNote(
      {required int noteID, required String boxName}) async {
    var box = Hive.box<NoteModel>(boxName);
    await box.deleteAt(noteID);
  }

  @override
  Future<void> removeAllNotes({required String boxName}) async {
    var box = Hive.box<NoteModel>(boxName);
    await box.clear();
  }
}

import 'package:hive/hive.dart';
import 'package:up_todo/features/notes/data/models/note_model.dart';
import 'store_note_repo.dart';

class StoreNotesRepoImpl extends StoreNoteRepo {
  @override
  Future<void> storeNotes(
      {required NoteModel noteModel, required String boxName}) async {
    var box = Hive.box<NoteModel>(boxName);
    await box.add(noteModel);
  }
}

import 'package:up_todo/features/notes/data/models/note_model.dart';
import '../../../../../core/utils/function/store_note_method.dart';
import 'store_note_repo.dart';

class StoreNotesRepoImpl extends StoreNoteRepo {
  @override
  Future<void> storeNotes(
      {required NoteModel noteModel, required String boxName}) async {
    await storeNoteMethod(noteModel: noteModel, boxName: boxName);
  }
}

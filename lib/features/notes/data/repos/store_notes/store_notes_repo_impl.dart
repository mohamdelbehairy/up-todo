import 'package:up_todo/features/notes/data/models/note_model.dart';
import '../../../../../core/utils/function/store_note_method.dart';
import 'store_notes_repo.dart';

class StoreNotesRepoImpl extends StoreNotesRepo {
  @override
  Future<void> storeNotes(
      {required NoteModel noteModel, required String boxName}) async {
    await storeNoteMethod(noteModel: noteModel, boxName: boxName);
  }
}

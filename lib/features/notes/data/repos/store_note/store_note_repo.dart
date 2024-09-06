import '../../models/note_model.dart';

abstract class StoreNoteRepo {
  Future<void> storeNotes(
      {required NoteModel noteModel, required String boxName});
}

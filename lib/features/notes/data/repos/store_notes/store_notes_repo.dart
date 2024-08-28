import '../../models/note_model.dart';

abstract class StoreNotesRepo {
  Future<void> storeNotes(
      {required NoteModel noteModel, required String boxName});
}

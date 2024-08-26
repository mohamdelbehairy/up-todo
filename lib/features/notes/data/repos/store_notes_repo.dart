import '../models/note_model.dart';

abstract class StoreNotesRepo {
  Future<void> storeAllNotes({required NoteModel noteModel});
  Future<void> storeFavouriteNotes();
  Future<void> storeHiddenNotes();
  Future<void> storeTrashNotes();
}

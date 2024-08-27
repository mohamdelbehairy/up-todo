import '../models/note_model.dart';

abstract class StoreNotesRepo {
  Future<void> storeAllNotes({required NoteModel noteModel});
  Future<void> storeFavouriteNotes({required NoteModel noteModel});
  Future<void> storeHiddenNotes();
  Future<void> storeTrashNotes();
}

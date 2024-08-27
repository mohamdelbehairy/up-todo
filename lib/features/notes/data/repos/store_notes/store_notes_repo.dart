import '../../models/note_model.dart';

abstract class StoreNotesRepo {
  Future<void> storeAllNotes({required NoteModel noteModel});
  Future<void> storeFavouriteNotes({required NoteModel noteModel});
  Future<void> storeHiddenNotes({required NoteModel noteModel});
  Future<void> storeTrashNotes({required NoteModel noteModel});
}

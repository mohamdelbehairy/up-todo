import 'package:up_todo/core/utils/constants.dart';
import 'package:up_todo/features/notes/data/models/note_model.dart';

import '../../../../../core/utils/function/store_note_method.dart';
import 'store_notes_repo.dart';

class StoreNotesRepoImpl extends StoreNotesRepo {
  @override
  Future<void> storeAllNotes({required NoteModel noteModel}) async {
    await storeNoteMethod(noteModel: noteModel, boxName: Constants.kAllNotes);
  }

  @override
  Future<void> storeFavouriteNotes({required NoteModel noteModel}) async {
    await storeNoteMethod(
        noteModel: noteModel, boxName: Constants.kFavouriteNotes);
  }

  @override
  Future<void> storeHiddenNotes({required NoteModel noteModel}) async {
    await storeNoteMethod(
        noteModel: noteModel, boxName: Constants.kHiddenNotes);
  }

  @override
  Future<void> storeTrashNotes() {
    throw UnimplementedError();
  }
}

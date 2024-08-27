import 'package:hive/hive.dart';
import 'package:up_todo/core/utils/constants.dart';
import 'package:up_todo/features/notes/data/models/note_model.dart';

import 'remove_notes_repo.dart';

class RemoveNotesRepoImpl extends RemoveNotesRepo {
  @override
  Future<void> removeFavouriteNotes({required int noteID}) async {
    var box = Hive.box<NoteModel>(Constants.kFavouriteNotes);
    await box.deleteAt(noteID);
  }

  @override
  Future<void> removeAllNotes({required int noteID}) async {
    var box = Hive.box<NoteModel>(Constants.kAllNotes);
    await box.deleteAt(noteID);
  }

  @override
  Future<void> removeHiddenNotes({required int noteID}) async {
    var box = Hive.box<NoteModel>(Constants.kHiddenNotes);
    await box.deleteAt(noteID);
  }
  
  @override
  Future<void> removeTrashNotes({required int noteID}) async{
    var box = Hive.box<NoteModel>(Constants.kTrashNotes);
    await box.deleteAt(noteID);
  }
}

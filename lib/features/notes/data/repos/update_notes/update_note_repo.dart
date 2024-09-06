import '../../models/note_model.dart';

abstract class UpdateNoteRepo {
  Future<void> updateNotesWithIndex(
      {required int index,
      required String boxName,
      required NoteModel noteModel});

  Future<void> updateNotesWithKey(
      {required dynamic key,
      required String boxName,
      required NoteModel noteModel});
}

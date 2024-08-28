import '../../models/note_model.dart';

abstract class UpdateNoteRepo {
  Future<void> updateNotes(
      {required int index,
      required String boxName,
      required NoteModel noteModel});
}

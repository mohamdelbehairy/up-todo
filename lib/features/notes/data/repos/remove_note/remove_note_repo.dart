abstract class RemoveNoteRepo {
  Future<void> removeNote({required int noteID, required String boxName});
  Future<void> removeAllNotes({required String boxName});
}

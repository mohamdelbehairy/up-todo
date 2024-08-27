abstract class RemoveNotesRepo {
  Future<void> removeFavouriteNotes({required int noteID});

  Future<void> removeAllNotes({required int noteID});
  Future<void> removeHiddenNotes({required int noteID});
}

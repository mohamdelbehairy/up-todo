import 'package:up_todo/features/notes/data/models/note_model.dart';

abstract class GetNotesRepo {
  List<NoteModel> getAllNotes();
  List<NoteModel> getFavouriteNotes();
  List<NoteModel> getHiddenNotes();
  List<NoteModel> getTrashNotes();
}

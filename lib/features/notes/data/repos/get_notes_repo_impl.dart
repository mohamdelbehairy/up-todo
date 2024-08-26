import 'package:hive/hive.dart';
import 'package:up_todo/core/utils/constants.dart';
import 'package:up_todo/features/notes/data/models/note_model.dart';
import 'package:up_todo/features/notes/data/repos/get_notes_repo.dart';

class GetNotesRepoImpl extends GetNotesRepo {
  @override
  List<NoteModel> getAllNotes() {
    var allNotes = Hive.box<NoteModel>(Constants.kAllNotes);
    return allNotes.values.toList();
  }

  @override
  List<NoteModel> getFavouriteNotes() {
    throw UnimplementedError();
  }

  @override
  List<NoteModel> getHiddenNotes() {
    throw UnimplementedError();
  }

  @override
  List<NoteModel> getTrashNotes() {
    throw UnimplementedError();
  }
}

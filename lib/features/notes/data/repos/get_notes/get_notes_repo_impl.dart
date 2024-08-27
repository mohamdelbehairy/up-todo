import 'package:up_todo/core/utils/constants.dart';
import 'package:up_todo/features/notes/data/models/note_model.dart';
import 'package:up_todo/features/notes/data/repos/get_notes/get_notes_repo.dart';

import '../../../../../core/utils/function/get_notes_method.dart';

class GetNotesRepoImpl extends GetNotesRepo {
  @override
  List<NoteModel> getAllNotes() {
    return getNotesMethod(Constants.kAllNotes);
  }

  @override
  List<NoteModel> getFavouriteNotes() {
    return getNotesMethod(Constants.kFavouriteNotes);
  }

  @override
  List<NoteModel> getHiddenNotes() {
     return getNotesMethod(Constants.kHiddenNotes);
  }

  @override
  List<NoteModel> getTrashNotes() {
    throw UnimplementedError();
  }
}

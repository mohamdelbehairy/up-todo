import 'package:up_todo/features/notes/data/models/note_model.dart';
import 'package:up_todo/features/notes/data/repos/get_notes/get_notes_repo.dart';

import '../../../../../core/utils/function/get_notes_method.dart';

class GetNotesRepoImpl extends GetNotesRepo {
  @override
  List<NoteModel> getNotes(String boxName) {
    return getNotesMethod(boxName);
  }
}

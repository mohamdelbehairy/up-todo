import 'package:get_it/get_it.dart';

import '../../../features/notes/data/repos/get_notes/get_notes_repo_impl.dart';
import '../../../features/notes/data/repos/remove_note/remove_note_repo_impl.dart';
import '../../../features/notes/data/repos/store_note/store_note_repo_impl.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<GetNotesRepoImpl>(GetNotesRepoImpl());
  getIt.registerSingleton<StoreNotesRepoImpl>(StoreNotesRepoImpl());
  getIt.registerSingleton<RemoveNoteRepoImpl>(RemoveNoteRepoImpl());
}

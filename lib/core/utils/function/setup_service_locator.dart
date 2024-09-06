import 'package:get_it/get_it.dart';

import '../../../features/notes/data/repos/get_notes/get_notes_repo_impl.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<GetNotesRepoImpl>(GetNotesRepoImpl());
}

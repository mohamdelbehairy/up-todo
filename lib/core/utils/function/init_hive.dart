import 'package:hive_flutter/hive_flutter.dart';
import 'package:up_todo/core/utils/constants.dart';
import 'package:up_todo/features/onboarding/data/models/open_first_time_model.dart';

import '../../../features/notes/data/models/note_model.dart';

Future<void> initHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());
  Hive.registerAdapter(OpenFirstTimeModelAdapter());
  await Future.wait([
    Hive.openBox<NoteModel>(Constants.kAllNotes),
    Hive.openBox<NoteModel>(Constants.kFavouriteNotes),
    Hive.openBox<NoteModel>(Constants.kHiddenNotes),
    Hive.openBox<NoteModel>(Constants.kTrashNotes),
    Hive.openBox<NoteModel>(Constants.kEvents),
    Hive.openBox<NoteModel>(Constants.kRecentSearch),
    Hive.openBox<OpenFirstTimeModel>(Constants.kOpenFirstTime),
  ]);
}

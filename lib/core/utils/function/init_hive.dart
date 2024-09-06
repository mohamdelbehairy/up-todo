import 'package:hive_flutter/hive_flutter.dart';
import 'package:up_todo/core/utils/constants.dart';

import '../../../features/notes/data/models/note_model.dart';

Future<void> initHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());
  await Future.wait([
    Hive.openBox<NoteModel>(Constants.kAllNotes),
    Hive.openBox<NoteModel>(Constants.kFavouriteNotes),
    Hive.openBox<NoteModel>(Constants.kHiddenNotes),
    Hive.openBox<NoteModel>(Constants.kTrashNotes),
    Hive.openBox<NoteModel>(Constants.kEvents)
  ]);
}

import 'dart:developer';

import 'package:hive/hive.dart';
import 'package:up_todo/core/utils/constants.dart';
import 'package:up_todo/features/notes/data/models/note_model.dart';

import 'store_notes_repo.dart';

class StoreNotesRepoImpl extends StoreNotesRepo {
  @override
  Future<void> storeAllNotes({required NoteModel noteModel}) async {
    var box = Hive.box<NoteModel>(Constants.kAllNotes);
    await box.add(noteModel);
    log('note added successfully');
    log('id: ${noteModel.id}');
    log('title: ${noteModel.title}');
    log('body: ${noteModel.body}');
  }

  @override
  Future<void> storeFavouriteNotes() {
    throw UnimplementedError();
  }

  @override
  Future<void> storeHiddenNotes() {
    throw UnimplementedError();
  }

  @override
  Future<void> storeTrashNotes() {
    throw UnimplementedError();
  }
}

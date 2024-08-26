import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/note_item_model.dart';
import '../manager/selected_type_note/selected_type_note_cubit.dart';
import 'build_show_item.dart';

class ShowNoteItem extends StatelessWidget {
  const ShowNoteItem({super.key, required this.noteItemModel});
  final NoteItemModel noteItemModel;

  @override
  Widget build(BuildContext context) {
    var selectedIndex = context.watch<SelectedTypeNoteCubit>().selectedIndex;
    if (selectedIndex == 0) {
      return ShowAllNotes(noteItemModel: noteItemModel);
    } else if (selectedIndex == 1) {
      return ShowFavoriteNotes(noteItemModel: noteItemModel);
    } else if (selectedIndex == 2) {
      return ShowHiddenNotes(noteItemModel: noteItemModel);
    } else if (selectedIndex == 3) {
      return ShowTrashNotes(noteItemModel: noteItemModel);
    }
    return ShowRecentNotes(noteItemModel: noteItemModel);
  }
}


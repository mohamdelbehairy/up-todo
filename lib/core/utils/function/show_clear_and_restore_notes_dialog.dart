import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:up_todo/core/models/custom_dialog_model.dart';
import 'package:up_todo/core/utils/assets.dart';
import '../../../features/notes/presentation/manager/selected_type_note/selected_type_note_cubit.dart';
import 'on_tap_store_and_remove_all_notes_to_fav.dart';
import 'show_custom_dialog.dart';

void showClearAndRestoreNotesDialog(BuildContext context) {
  var selectedIndex = context.read<SelectedTypeNoteCubit>().selectedIndex;

  List<CustomDialogModel> items = [
    if (selectedIndex <= 1)
      CustomDialogModel(
          title: selectedIndex == 0 ? 'Favourite all notes' : 'Clear all notes',
          backgroundColor: const Color(0xffF7CE45),
          image: Assets.imagesFavourite,
          onTap: () async {
            await onTapStoreAndRemoveAllNotesToFav(context);
          }),
    if (selectedIndex <= 0 || selectedIndex == 2)
      CustomDialogModel(
          title: selectedIndex == 2 ? 'Show all notes' : 'Hidden all notes',
          backgroundColor: const Color(0xff4E94F8),
          image: Assets.imagesHidden,
          onTap: () async {}),
    if (selectedIndex != 1)
      CustomDialogModel(
          title: selectedIndex == 3 ? 'Restore all notes' : 'Trash all notes',
          backgroundColor: const Color(0xffEB4D3D),
          image: Assets.imagesTrash,
          onTap: () async {})
  ];
  showCustomDialog(context, items);
}

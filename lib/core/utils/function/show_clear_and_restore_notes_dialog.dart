import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:up_todo/core/models/custom_dialog_model.dart';
import 'package:up_todo/core/utils/assets.dart';
import '../../../features/notes/presentation/manager/selected_type_note/selected_type_note_cubit.dart';
import '../../../features/notes/presentation/widgets/function/on_tap_all_clear_trash.dart';
import '../../../features/notes/presentation/widgets/function/on_tap_all_favourite.dart';
import '../../../features/notes/presentation/widgets/function/on_tap_all_hidden.dart';
import '../../../features/notes/presentation/widgets/function/on_tap_all_trash.dart';
import 'show_custom_dialog.dart';

void showClearAndRestoreNotesDialog(BuildContext context) {
  var selectedIndex = context.read<SelectedTypeNoteCubit>().selectedIndex;

  List<CustomDialogModel> items = [
    if (selectedIndex <= 1)
      CustomDialogModel(
          title: selectedIndex == 0
              ? 'Favourite all notes'
              : 'Unfavourite all notes',
          backgroundColor: const Color(0xffF7CE45),
          image: Assets.imagesFavourite,
          onTap: () async {
            GoRouter.of(context).pop();
            await onTapAllFavourite(context);
          }),
    if (selectedIndex <= 0 || selectedIndex == 2)
      CustomDialogModel(
          title: selectedIndex == 2 ? 'Show all notes' : 'Hidden all notes',
          backgroundColor: const Color(0xff4E94F8),
          image: Assets.imagesHidden,
          onTap: () async {
            GoRouter.of(context).pop();
            await onTapAllHidden(context);
          }),
    // if (selectedIndex != 1)
      CustomDialogModel(
          title: selectedIndex == 3 ? 'Restore all notes' : 'Trash all notes',
          backgroundColor: const Color(0xffEB4D3D),
          image: Assets.imagesTrash,
          onTap: () async {
            GoRouter.of(context).pop();
            await onTapAllTrash(context);
          }),
    if (selectedIndex == 3)
      CustomDialogModel(
          title: 'Clear all notes',
          backgroundColor: const Color(0xffEB4D3D),
          image: Assets.imagesTrash,
          onTap: () async {
            GoRouter.of(context).pop();
            await onTapAllClearTrash(context);
          })
  ];
  showCustomDialog(context, items);
}

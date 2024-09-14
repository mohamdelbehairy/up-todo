import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:up_todo/core/utils/assets.dart';
import 'package:up_todo/features/notes/data/models/note_model.dart';
import 'package:up_todo/features/notes/presentation/widgets/function/on_tap_hidden.dart';
import '../../../features/notes/presentation/manager/selected_type_note/selected_type_note_cubit.dart';
import '../../../features/notes/presentation/widgets/function/on_tap_favourtie.dart';
import '../../../features/notes/presentation/widgets/function/on_tap_trash.dart';
import '../../models/custom_dialog_model.dart';
import 'show_custom_dialog.dart';

void showCustomNotesDialog(BuildContext context,
    {required NoteModel noteModel, required int index}) {
  var selectedIndex = context.read<SelectedTypeNoteCubit>().selectedIndex;

  List<CustomDialogModel> items = [
    if ((selectedIndex <= 0 && !noteModel.isFavourite) || selectedIndex == 1)
      CustomDialogModel(
          title: noteModel.isFavourite ? 'Unfavourite' : 'Favourite',
          backgroundColor: const Color(0xffF7CE45),
          image: Assets.imagesFavourite,
          onTap: () async {
            GoRouter.of(context).pop();
            await onTapFavourite(context, noteModel, index);
          }),
    if (selectedIndex <= 0 || selectedIndex == 2)
      CustomDialogModel(
          title: noteModel.isHidden ? 'Show' : 'Hidden',
          backgroundColor: const Color(0xff4E94F8),
          image: Assets.imagesHidden,
          onTap: () async {
            GoRouter.of(context).pop();
            await onTapHidden(context, noteModel, index);
          }),
    if (selectedIndex != 1)
      CustomDialogModel(
          title: noteModel.isTrash ? 'Restore' : 'Trash',
          backgroundColor: const Color(0xffEB4D3D),
          image: Assets.imagesTrash,
          onTap: () async {
            GoRouter.of(context).pop();
            await onTapTrash(context, noteModel, index);
          })
  ];
  showCustomDialog(context, items);
}

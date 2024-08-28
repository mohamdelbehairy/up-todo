import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:up_todo/core/utils/assets.dart';
import 'package:up_todo/core/utils/colors.dart';
import 'package:up_todo/core/utils/constants.dart';
import 'package:up_todo/features/notes/data/models/note_model.dart';
import 'package:up_todo/features/notes/presentation/manager/get_notes/get_notes_cubit.dart';
import 'package:up_todo/features/notes/presentation/manager/selected_type_note/selected_type_note_cubit.dart';

import '../../../features/notes/presentation/manager/remove_note/remove_note_cubit.dart';
import '../../../features/notes/presentation/manager/store_note/store_note_cubit.dart';
import '../../models/custom_dialog_model.dart';
import '../../widgets/custom_dialog_item.dart';

void showCustomDialog(BuildContext context,
    {required NoteModel noteModel, required int index}) {
  var getNotes = context.read<GetNotesCubit>();
  var selectedIndex = context.read<SelectedTypeNoteCubit>().selectedIndex;
  var isFavourite = getNotes.favouriteNotes.contains(noteModel);
  var isHidden = getNotes.hiddenNotes.contains(noteModel);
  var isTrash = getNotes.trashNotes.contains(noteModel);
  var removeNote = context.read<RemoveNoteCubit>();
  List<CustomDialogModel> items = [
    if (selectedIndex <= 1)
      CustomDialogModel(
          title: isFavourite ? 'Unfavourite' : 'Favourite',
          backgroundColor: const Color(0xffF7CE45),
          image: Assets.imagesFavourite,
          onTap: () async {
            GoRouter.of(context).pop();
            if (isFavourite) {
              await removeNote.removeNote(
                  noteID: index, boxName: Constants.kFavouriteNotes);
            } else {
              await context.read<StoreNoteCubit>().storeNote(
                  noteModel: noteModel, boxName: Constants.kFavouriteNotes);
            }
            getNotes.getFavouriteNotes();
          }),
    if (selectedIndex <= 0 || selectedIndex == 2)
      CustomDialogModel(
          title: isHidden ? 'Show note' : 'Hidden',
          backgroundColor: const Color(0xff4E94F8),
          image: Assets.imagesHidden,
          onTap: () async {
            GoRouter.of(context).pop();
            if (!isHidden) {
              await context.read<StoreNoteCubit>().storeNote(
                  noteModel: noteModel, boxName: Constants.kHiddenNotes);
              await removeNote.removeNote(
                  noteID: index, boxName: Constants.kAllNotes);
              if (isFavourite) {
                await removeNote.removeNote(
                    noteID: index, boxName: Constants.kFavouriteNotes);
              }
            } else {
              await context.read<StoreNoteCubit>().storeNote(
                  noteModel: noteModel, boxName: Constants.kAllNotes);
              await removeNote.removeNote(
                  noteID: index, boxName: Constants.kHiddenNotes);
            }

            getNotes.getFavouriteNotes();
            getNotes.getHiddenNotes();
            getNotes.getAllNotes();
          }),
    if (selectedIndex != 1)
      CustomDialogModel(
          title: isTrash ? 'Restore' : 'Trash',
          backgroundColor: const Color(0xffEB4D3D),
          image: Assets.imagesTrash,
          onTap: () async {
            GoRouter.of(context).pop();
            if (!isTrash) {
              await context.read<StoreNoteCubit>().storeNote(
                  noteModel: noteModel, boxName: Constants.kTrashNotes);
              if (isHidden) {
                await removeNote.removeNote(
                    noteID: index, boxName: Constants.kHiddenNotes);
              } else {
                await removeNote.removeNote(
                    noteID: index, boxName: Constants.kAllNotes);
              }

              if (isFavourite) {
                await removeNote.removeNote(
                    noteID: index, boxName: Constants.kFavouriteNotes);
              }
            } else {
              await context.read<StoreNoteCubit>().storeNote(
                  noteModel: noteModel, boxName: Constants.kAllNotes);
              await removeNote.removeNote(
                  noteID: index, boxName: Constants.kTrashNotes);
            }

            getNotes.getFavouriteNotes();
            getNotes.getHiddenNotes();
            getNotes.getTrashNotes();
            getNotes.getAllNotes();
          })
  ];
  showGeneralDialog(
    context: context,
    barrierLabel: "",
    barrierDismissible: true,
    barrierColor: Colors.black.withOpacity(0.5),
    transitionDuration: const Duration(milliseconds: 700),
    pageBuilder: (_, __, ___) {
      return Center(
        child: Material(
          color: Colors.transparent,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: AppColors.backgroundColor,
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(items.length, (index) {
                return Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: index == 1 ? 12 : 0.0),
                    child: CustomDialogItem(customDialogModel: items[index]));
              }),
            ),
          ),
        ),
      );
    },
    transitionBuilder: (_, anim, __, child) {
      Tween<Offset> tween;
      if (anim.status == AnimationStatus.reverse) {
        tween = Tween(begin: const Offset(-1, 0), end: Offset.zero);
      } else {
        tween = Tween(begin: const Offset(1, 0), end: Offset.zero);
      }

      return SlideTransition(
        position: tween.animate(anim),
        child: FadeTransition(
          opacity: anim,
          child: child,
        ),
      );
    },
  );
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:up_todo/core/models/flutter_toast_model.dart';
import 'package:up_todo/core/utils/colors.dart';
import 'package:up_todo/core/utils/constants.dart';

import '../../../../../core/widgets/custom_flutter_toast.dart';
import '../../manager/get_notes/get_notes_cubit.dart';
import '../../manager/remove_note/remove_note_cubit.dart';

Future<void> onTapAllClearTrash(BuildContext context) async {
  var getNotes = context.read<GetNotesCubit>();
  await context
      .read<RemoveNoteCubit>()
      .removeAllNotes(boxName: Constants.kTrashNotes);
  CustomFlutterToast.showCustomFlutterToast(
      flutterToastModel: FlutterToastModel(
          message: 'All notes are empty',
          backgroundColor: AppColors.trashNotesColor));
  getNotes.getTrashNotes();
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:up_todo/core/utils/constants.dart';

import '../../manager/get_notes/get_notes_cubit.dart';
import '../../manager/remove_note/remove_note_cubit.dart';

Future<void> onTapAllClearTrash(BuildContext context) async {
  var getNotes = context.read<GetNotesCubit>();
  await context
      .read<RemoveNoteCubit>()
      .removeAllNotes(boxName: Constants.kTrashNotes);
  getNotes.getTrashNotes();
}

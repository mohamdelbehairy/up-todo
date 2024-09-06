import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:up_todo/core/utils/styles.dart';
import 'package:up_todo/core/widgets/custom_back_widget.dart';
import '../../../../core/utils/function/show_clear_and_restore_notes_dialog.dart';
import '../../../../core/widgets/app_bar_circle_setting_button.dart';
import '../manager/selected_type_note/selected_type_note_cubit.dart';

class NoteViewUnSelectedAppBar extends StatelessWidget {
  const NoteViewUnSelectedAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Text('Notes', style: Styles.styleBold26);
  }
}

class NoteViewSelectedAppBar extends StatelessWidget {
  const NoteViewSelectedAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomBackWidget(onTap: () {
          context.read<SelectedTypeNoteCubit>().changeSelectedTypeNote(-1);
          context.read<SelectedTypeNoteCubit>().listViewChangeIndex(-1);
          context.read<SelectedTypeNoteCubit>().gradeViewChangeIndex(-1);
        }),
        AppBarCircleSettingButton(onTap: () {
          showClearAndRestoreNotesDialog(context);
        })
      ],
    );
  }
}

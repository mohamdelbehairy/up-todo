import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:up_todo/core/models/svg_model.dart';
import 'package:up_todo/core/utils/assets.dart';
import 'package:up_todo/core/utils/styles.dart';
import 'package:up_todo/core/widgets/custom_back_widget.dart';
import 'package:up_todo/core/widgets/custom_svg.dart';
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
        InkWell(
            onTap: () {
              
            },
            child: CustomSvg(
                svgModel: SvgModel(
                    height: 22, width: 22, image: Assets.imagesCircleSetting)))
      ],
    );
  }
}

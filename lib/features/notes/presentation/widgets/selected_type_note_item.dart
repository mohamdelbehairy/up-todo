import 'package:flutter/material.dart';
import 'package:up_todo/core/models/svg_model.dart';
import 'package:up_todo/core/utils/styles.dart';
import 'package:up_todo/core/widgets/custom_svg.dart';

import '../../data/models/selected_type_note_model.dart';

class SelectedTypeNoteItem extends StatelessWidget {
  const SelectedTypeNoteItem(
      {super.key, required this.selectedTypeNoteModel, required this.isActive});
  final SelectedTypeNoteModel selectedTypeNoteModel;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 168,
      padding: const EdgeInsets.only(left: 16),
      decoration: BoxDecoration(
          color:
              isActive ? selectedTypeNoteModel.backgroundColor : Colors.white,
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          CircleAvatar(
            radius: 16,
            backgroundColor: selectedTypeNoteModel.backgroundColor,
            child: CustomSvg(
              svgModel: SvgModel(
                  image: selectedTypeNoteModel.image,
                  height: 18,
                  colorFilter:
                      const ColorFilter.mode(Colors.white, BlendMode.srcIn)),
            ),
          ),
          const SizedBox(width: 8),
          Text(selectedTypeNoteModel.name,
              style: Styles.styleRegular15
                  .copyWith(color: isActive ? Colors.white : null))
        ],
      ),
    );
  }
}

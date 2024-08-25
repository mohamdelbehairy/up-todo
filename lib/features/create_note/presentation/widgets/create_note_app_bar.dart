import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/widgets/custom_back_widget.dart';
import 'save_button.dart';

class CreateNoteAppBar extends StatelessWidget {
  const CreateNoteAppBar({super.key, required this.onTap});
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomBackWidget(onTap: () => GoRouter.of(context).pop()),
        SaveButton(onTap: onTap),
      ],
    );
  }
}

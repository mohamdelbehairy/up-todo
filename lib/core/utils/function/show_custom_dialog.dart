import 'package:flutter/material.dart';
import 'package:up_todo/core/models/custom_dialog_model.dart';

import '../../widgets/show_custom_dialog_body.dart';

Future<Object?> showCustomDialog(
    BuildContext context, List<CustomDialogModel> items) {
  return showGeneralDialog(
    context: context,
    barrierLabel: "",
    barrierDismissible: true,
    barrierColor: Colors.black.withOpacity(0.5),
    transitionDuration: const Duration(milliseconds: 700),
    pageBuilder: (_, __, ___) {
      return ShowCustomDialogBody(items: items);
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
        child: FadeTransition(opacity: anim, child: child),
      );
    },
  );
}

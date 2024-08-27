import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:up_todo/core/utils/assets.dart';
import 'package:up_todo/core/utils/colors.dart';

import '../../models/custom_dialog_model.dart';
import '../../widgets/custom_dialog_item.dart';

void showCustomDialog(BuildContext context) {
  List<CustomDialogModel> items = [
    CustomDialogModel(
        backgroundColor: const Color(0xffF7CE45),
        image: Assets.imagesFavourite,
        onTap: () {
          log('favourite');
          GoRouter.of(context).pop();
        }),
    CustomDialogModel(
        backgroundColor: const Color(0xff4E94F8),
        image: Assets.imagesHidden,
        onTap: () {
          log('hidden');
        }),
    CustomDialogModel(
        backgroundColor: const Color(0xffEB4D3D),
        image: Assets.imagesTrash,
        onTap: () {
          log('trash');
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
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          padding: const EdgeInsets.all(20),
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

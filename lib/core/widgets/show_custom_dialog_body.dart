import 'package:flutter/material.dart';
import 'package:up_todo/core/models/custom_dialog_model.dart';
import 'package:up_todo/core/utils/colors.dart';
import '../../features/notes/presentation/widgets/show_custom_dialog_item.dart';

class ShowCustomDialogBody extends StatelessWidget {
  const ShowCustomDialogBody({super.key, required this.items});

  final List<CustomDialogModel> items;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Material(
            color: Colors.transparent,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 30),
              padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
              decoration: BoxDecoration(
                  color: AppColors.backgroundColor,
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(items.length, (index) {
                  return Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: ShowCustomDialogItem(
                          customDialogModel: items[index]));
                }),
              ),
            )));
  }
}

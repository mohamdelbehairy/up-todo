import 'package:flutter/material.dart';
import 'package:up_todo/core/utils/styles.dart';

class SaveButton extends StatelessWidget {
  const SaveButton({super.key, required this.onTap});
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          height: 35,
          width: 70,
          decoration: BoxDecoration(
              color: const Color(0xff1F2124),
              borderRadius: BorderRadius.circular(10)),
          child: Center(child: Text('Save', style: Styles.styleSaveButton))),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:up_todo/core/models/no_notes_found_model.dart';
import 'package:up_todo/core/utils/styles.dart';

class NoNotesFoundWidget extends StatelessWidget {
  const NoNotesFoundWidget({super.key, required this.noNotesFoundModel});
  final NoNotesFoundModel noNotesFoundModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
          color: noNotesFoundModel.backgroundColor ?? Colors.white,
          borderRadius: BorderRadius.circular(10)),
      child: Align(
        alignment: noNotesFoundModel.alignment,
        child: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Text(noNotesFoundModel.text,
              style: noNotesFoundModel.style ?? Styles.styleItalic17),
        ),
      ),
    );
  }
}

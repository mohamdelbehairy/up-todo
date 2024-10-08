import 'package:flutter/material.dart';
import 'package:up_todo/core/utils/colors.dart';
import 'package:up_todo/core/utils/styles.dart';
import 'package:up_todo/features/create_note/data/models/text_field_model.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key, required this.textFieldModel});
  final TextFieldModel textFieldModel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 37.44,
      child: TextField(
        controller: textFieldModel.controller,
        onChanged: textFieldModel.onChanged,
        cursorColor: AppColors.secondaryColor,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(left: 16),
            border: buildBorder(),
            focusedBorder: buildBorder(),
            enabledBorder: buildBorder(),
            filled: true,
            fillColor: Colors.white,
            suffixIcon: textFieldModel.controller!.text.isNotEmpty
                ? GestureDetector(
                    onTap: textFieldModel.suffixTap,
                    child: Icon(Icons.close,
                        color: AppColors.primaryColor.withOpacity(.6)))
                : null,
            hintText: 'Search',
            hintStyle: Styles.styleRegularOpacity17),
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(10.0),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:up_todo/core/utils/colors.dart';
import 'package:up_todo/core/utils/styles.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 37.44,
      child: TextField(
        cursorColor: AppColors.secondaryColor,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(left: 16),
            border: buildBorder(),
            focusedBorder: buildBorder(),
            enabledBorder: buildBorder(),
            filled: true,
            fillColor: Colors.white,
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

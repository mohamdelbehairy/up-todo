import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/search_text_field.dart';
import '../../../create_note/data/models/text_field_model.dart';
import '../manager/search/search_cubit.dart';

class SearchViewTextField extends StatelessWidget {
  const SearchViewTextField({super.key, required this.controller});
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    var notes = context.watch<SearchCubit>();
    return SearchTextField(
      textFieldModel: TextFieldModel(
          controller: controller,
          onChanged: (value) {
            notes.searchNotes(value);
          },
          suffixTap: () {
            controller.clear();
            notes.searchNotes('');
            context.read<SearchCubit>().gridViewAvtiveIndex = -1;
            context.read<SearchCubit>().listViewAvtiveIndex = -1;
          }),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/search_text_field.dart';
import '../../../create_note/data/models/text_field_model.dart';
import '../manager/search/search_cubit.dart';

class SearchViewTextField extends StatefulWidget {
  const SearchViewTextField({super.key});

  @override
  State<SearchViewTextField> createState() => _SearchViewTextFieldState();
}

class _SearchViewTextFieldState extends State<SearchViewTextField> {
  late TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var notes = context.watch<SearchCubit>();
    return SearchTextField(
      textFieldModel: TextFieldModel(
          controller: _controller,
          onChanged: (value) {
            notes.searchNotes(value);
          },
          suffixTap: () {
            _controller.clear();
            notes.searchNotes('');
            context.read<SearchCubit>().gridViewAvtiveIndex = -1;
            context.read<SearchCubit>().listViewAvtiveIndex = -1;
          }),
    );
  }
}

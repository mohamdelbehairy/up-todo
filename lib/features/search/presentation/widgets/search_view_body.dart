import 'package:flutter/material.dart';
import 'package:up_todo/core/models/app_bar_model.dart';
import 'package:up_todo/core/models/no_notes_found_model.dart';
import 'package:up_todo/core/utils/styles.dart';
import 'package:up_todo/core/widgets/custom_app_bar.dart';

import '../../../../core/widgets/no_notes_found_widget.dart';
import '../../../../core/widgets/search_text_field.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 24),
        CustomAppBar(appBarModel: AppBarModel(title: 'Notes', onTap: () {})),
        const SizedBox(height: 16),
        const SearchTextField(),
        const SizedBox(height: 24),
        Text('Recent Searches', style: Styles.styleRegular17),
        const SizedBox(height: 16),
        NoNotesFoundWidget(
            noNotesFoundModel: NoNotesFoundModel(
                alignment: Alignment.centerLeft,
                text: 'No recent searches to display'))
      ],
    );
  }
}

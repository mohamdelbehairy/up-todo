import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:up_todo/core/models/no_notes_found_model.dart';
import 'package:up_todo/core/widgets/no_notes_found_widget.dart';

import '../../../../core/utils/function/show_clear_recent_search_dialog.dart';
import '../../../notes/data/models/note_item_model.dart';
import '../../../notes/presentation/widgets/build_show_item.dart';
import '../manager/search_result/search_result_cubit.dart';

class RecentAndNoRecentSearch extends StatelessWidget {
  const RecentAndNoRecentSearch({super.key});

  @override
  Widget build(BuildContext context) {
    var notes = context.read<SearchResultCubit>();
    return BlocBuilder<SearchResultCubit, SearchResultState>(
      builder: (context, state) {
        if (notes.recentSearch.isEmpty) {
          return NoNotesFoundWidget(
              noNotesFoundModel: NoNotesFoundModel(
                  alignment: Alignment.centerLeft,
                  text: 'No recent searches to display'));
        }
        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: notes.recentSearch.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisSpacing: 2, crossAxisSpacing: 8),
          itemBuilder: (BuildContext context, int index) {
            return Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: ShowRecentNotes(
                    noteItemModel: NoteItemModel(
                        width: double.infinity,
                        note: notes.recentSearch[index],
                        onTap: () async {
                          notes.changeGridViewActiveIndex(index);
                        },
                        onLongTap: () {
                          showClearRecentSearchDialog(context, index);
                        },
                        isActive: notes.activeIndex == index)));
          },
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:up_todo/core/utils/constants.dart';

import '../../../notes/data/models/note_item_model.dart';
import '../../../notes/data/models/note_model.dart';
import '../../../notes/presentation/manager/store_note/store_note_cubit.dart';
import '../../../notes/presentation/widgets/build_show_item.dart';
import '../manager/search/search_cubit.dart';
import '../manager/search_result/search_result_cubit.dart';

class SearchResultGridView extends StatelessWidget {
  const SearchResultGridView({super.key, required this.gridNotes});

  final List<NoteModel> gridNotes;

  @override
  Widget build(BuildContext context) {
    var notes = context.read<SearchCubit>();
    var allNotes = context.read<SearchResultCubit>();
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: gridNotes.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, mainAxisSpacing: 8, crossAxisSpacing: 8),
      itemBuilder: (context, index) {
        return ShowRecentNotes(
            noteItemModel: NoteItemModel(
                width: double.infinity,
                note: gridNotes[index],
                onTap: () async {
                  notes.gradeViewChangeIndex(index);
                  notes.listViewChangeIndex(-1);
                  if (!allNotes.allNotes.any((note) =>
                      note.title == gridNotes[index].title &&
                      note.body == gridNotes[index].body)) {
                    await context.read<StoreNoteCubit>().storeNote(
                        noteModel: gridNotes[index],
                        boxName: Constants.kRecentSearch);
                    allNotes.getRecentSearch();
                  }
                },
                onLongTap: () {},
                isActive: notes.gridViewAvtiveIndex == index));
      },
    );
  }
}

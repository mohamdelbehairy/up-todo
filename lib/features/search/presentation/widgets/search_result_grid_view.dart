import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../notes/data/models/note_item_model.dart';
import '../../../notes/data/models/note_model.dart';
import '../../../notes/presentation/widgets/build_show_item.dart';
import '../manager/search/search_cubit.dart';

class SearchResultGridView extends StatelessWidget {
  const SearchResultGridView({super.key, required this.gridNotes});

  final List<NoteModel> gridNotes;

  @override
  Widget build(BuildContext context) {
    var notes = context.read<SearchCubit>();
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
                onTap: () {
                  notes.gradeViewChangeIndex(index);
                  notes.listViewChangeIndex(-1);
                },
                onLongTap: () {},
                isActive: notes.gridViewAvtiveIndex == index));
      },
    );
  }
}

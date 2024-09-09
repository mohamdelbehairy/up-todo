import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:up_todo/features/notes/presentation/widgets/build_show_item.dart';

import '../../../notes/data/models/note_item_model.dart';
import '../../../notes/data/models/note_model.dart';
import '../manager/search/search_cubit.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key, required this.listNotes});

  final List<NoteModel> listNotes;

  @override
  Widget build(BuildContext context) {
    var notes = context.read<SearchCubit>();
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: listNotes.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: ShowRecentNotes(
                noteItemModel: NoteItemModel(
                    width: double.infinity,
                    note: listNotes[index],
                    onTap: () {
                      notes.listViewChangeIndex(index);
                      notes.gradeViewChangeIndex(-1);
                    },
                    onLongTap: () {},
                    isActive: notes.listViewAvtiveIndex == index)));
      },
    );
  }
}

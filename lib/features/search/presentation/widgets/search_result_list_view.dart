import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:up_todo/core/utils/constants.dart';
import 'package:up_todo/features/notes/presentation/widgets/build_show_item.dart';

import '../../../notes/data/models/note_item_model.dart';
import '../../../notes/data/models/note_model.dart';
import '../../../notes/presentation/manager/store_note/store_note_cubit.dart';
import '../manager/search/search_cubit.dart';
import '../manager/search_result/search_result_cubit.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key, required this.listNotes});

  final List<NoteModel> listNotes;

  @override
  Widget build(BuildContext context) {
    var notes = context.read<SearchCubit>();
    var allNotes = context.read<SearchResultCubit>();
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
                    onTap: () async {
                      notes.listViewChangeIndex(index);
                      notes.gradeViewChangeIndex(-1);
                      if (!allNotes.allNotes.any((note) =>
                          note.title == listNotes[index].title &&
                          note.body == listNotes[index].body)) {
                        await context.read<StoreNoteCubit>().storeNote(
                            noteModel: listNotes[index],
                            boxName: Constants.kRecentSearch);
                        allNotes.getRecentSearch();
                      }
                    },
                    onLongTap: () {},
                    isActive: notes.listViewAvtiveIndex == index)));
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:up_todo/features/notes/data/models/note_model.dart';
import '../manager/search/search_cubit.dart';
import 'search_result_grid_view.dart';
import 'search_result_list_view.dart';

class ShowSearchResult extends StatelessWidget {
  const ShowSearchResult({super.key});

  @override
  Widget build(BuildContext context) {
    var notes = context.read<SearchCubit>();
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (notes.displayAllNotes.isNotEmpty) {
          final List<NoteModel> gridNotes = notes.displayAllNotes.length > 2
              ? notes.displayAllNotes.sublist(0, 2)
              : notes.displayAllNotes;
          final List<NoteModel> listNotes = notes.displayAllNotes.length > 2
              ? notes.displayAllNotes.sublist(2)
              : [];
          return Column(
            children: [
              SearchResultGridView(gridNotes: gridNotes),
              const SizedBox(height: 12),
              SearchResultListView(listNotes: listNotes)
            ],
          );
        }
        return const SizedBox();
      },
    );
  }
}

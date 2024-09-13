import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:up_todo/core/utils/function/setup_service_locator.dart';
import 'package:up_todo/core/widgets/build_view.dart';
import '../../../notes/data/repos/get_notes/get_notes_repo_impl.dart';
import '../../../notes/data/repos/remove_note/remove_note_repo_impl.dart';
import '../manager/search_result/search_result_cubit.dart';
import '../widgets/search_view_body.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchResultCubit(
          getIt.get<GetNotesRepoImpl>(), getIt.get<RemoveNoteRepoImpl>())
        ..getRecentSearch(),
      child: const BuildView(child: SearchViewBody()),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:up_todo/core/widgets/build_view.dart';
import 'package:up_todo/features/notes/presentation/manager/selected_type_note/selected_type_note_cubit.dart';
import 'package:up_todo/features/notes/presentation/widgets/notes_view_body.dart';

import '../../data/repos/get_notes_repo_impl.dart';
import '../manager/get_notes/get_notes_cubit.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SelectedTypeNoteCubit()),
        BlocProvider(
            create: (context) =>
                GetNotesCubit(GetNotesRepoImpl())..getAllNotes()),
      ],
      child: const BuildView(child: NotesViewBody()),
    );
  }
}

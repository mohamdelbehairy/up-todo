import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:up_todo/core/widgets/build_view.dart';
import 'package:up_todo/features/notes/data/repos/store_notes_repo_impl.dart';
import 'package:up_todo/features/notes/presentation/manager/selected_type_note/selected_type_note_cubit.dart';
import 'package:up_todo/features/notes/presentation/manager/store_types_note/store_types_note_cubit.dart';
import 'package:up_todo/features/notes/presentation/widgets/notes_view_body.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SelectedTypeNoteCubit(),
        ),
        BlocProvider(
            create: (context) => StoreTypesNoteCubit(StoreNotesRepoImpl())),
      ],
      child: const BuildView(child: NotesViewBody()),
    );
  }
}

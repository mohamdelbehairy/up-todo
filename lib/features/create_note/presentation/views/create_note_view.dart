import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:up_todo/features/create_note/presentation/manager/store_all_notes/store_all_notes_cubit.dart';
import 'package:up_todo/features/notes/data/repos/store_notes_repo_impl.dart';
import '../../../../core/widgets/build_view.dart';
import '../widgets/create_note_view_body.dart';

class CreateNoteView extends StatelessWidget {
  const CreateNoteView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StoreAllNotesCubit(StoreNotesRepoImpl()),
      child: const BuildView(child: CreateNoteViewBody()),
    );
  }
}

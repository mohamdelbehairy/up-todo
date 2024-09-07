import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:up_todo/core/utils/function/setup_service_locator.dart';
import 'package:up_todo/core/widgets/build_view.dart';
import 'package:up_todo/features/events/presentation/widgets/events_view_body.dart';
import '../../../notes/data/repos/remove_note/remove_note_repo_impl.dart';
import '../manager/remove_events/remove_events_cubit.dart';

class EventsView extends StatelessWidget {
  const EventsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RemoveEventsCubit(getIt.get<RemoveNoteRepoImpl>()),
      child: const BuildView(child: EventsViewBody()),
    );
  }
}

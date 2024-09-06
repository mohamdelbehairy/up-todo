import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:up_todo/core/widgets/build_view.dart';
import 'package:up_todo/features/events/presentation/manager/get_events/get_events_cubit.dart';
import 'package:up_todo/features/events/presentation/widgets/events_view_body.dart';
import 'package:up_todo/features/notes/data/repos/get_notes/get_notes_repo_impl.dart';

class EventsView extends StatelessWidget {
  const EventsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetEventsCubit(GetNotesRepoImpl())..getEvents(),
      child: const BuildView(child: EventsViewBody()),
    );
  }
}

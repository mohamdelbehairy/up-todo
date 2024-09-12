import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:up_todo/core/utils/function/setup_service_locator.dart';

import '../../features/events/presentation/manager/get_events/get_events_cubit.dart';
import '../../features/events/presentation/manager/remove_events/remove_events_cubit.dart';
import '../../features/home/presentation/manager/bottom_navigation/bottom_navigation_cubit.dart';
import '../../features/notes/data/repos/get_notes/get_notes_repo_impl.dart';
import '../../features/notes/data/repos/remove_note/remove_note_repo_impl.dart';
import '../../features/notes/data/repos/store_note/store_note_repo_impl.dart';
import '../../features/notes/presentation/manager/get_notes/get_notes_cubit.dart';
import '../../features/notes/presentation/manager/store_note/store_note_cubit.dart';
import '../../features/notification/data/repos/notification_repo_impl.dart';
import '../../features/notification/presentation/manager/notification/notification_cubit.dart';
import '../../features/onboarding/presentation/manager/on_boardring/on_boardring_cubit.dart';
import '../../features/search/presentation/manager/search/search_cubit.dart';
import '../../features/search/presentation/manager/search_result/search_result_cubit.dart';

class UpTodoMultiBlocProvider extends StatelessWidget {
  const UpTodoMultiBlocProvider({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (context) => OnBoardringCubit()),
      BlocProvider(create: (context) => BottomNavigationCubit()),
      BlocProvider(
          create: (context) => GetNotesCubit(getIt.get<GetNotesRepoImpl>())
            ..getAllNotes()
            ..getFavouriteNotes()
            ..getHiddenNotes()
            ..getTrashNotes()),
      BlocProvider(
          create: (context) => StoreNoteCubit(getIt.get<StoreNotesRepoImpl>())),
      BlocProvider(
          create: (context) =>
              GetEventsCubit(getIt.get<GetNotesRepoImpl>())..getEvents()),
      BlocProvider(
          create: (context) => NotificationCubit(NotificationRepoImpl())),
      BlocProvider(
          create: (context) =>
              RemoveEventsCubit(getIt.get<RemoveNoteRepoImpl>())),
      BlocProvider(
          create: (context) => SearchCubit(getIt.get<GetNotesRepoImpl>())),
      BlocProvider(
          create: (context) => SearchResultCubit(
              getIt.get<GetNotesRepoImpl>(), getIt.get<RemoveNoteRepoImpl>())
            ..getRecentSearch())
    ], child: child);
  }
}

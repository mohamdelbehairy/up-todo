import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:up_todo/core/utils/assets.dart';
import 'package:up_todo/core/utils/function/show_custom_dialog.dart';
import '../../../features/events/presentation/widgets/function/events_flutter_toast.dart';
import '../../../features/search/presentation/manager/search_result/search_result_cubit.dart';
import '../../models/custom_dialog_model.dart';

void showAllClearRecentSearchDialog(BuildContext context) {
  var notes = context.read<SearchResultCubit>();
  List<CustomDialogModel> items = [
    CustomDialogModel(
        title: 'Delete all notes',
        backgroundColor: const Color(0xffEB4D3D),
        image: Assets.imagesTrash,
        onTap: () async {
          GoRouter.of(context).pop();
          if (notes.recentSearch.isNotEmpty) {
            await context.read<SearchResultCubit>().removeAllRecentSearch();
            eventsFlutterToast('All notes removed from the list');
          } else {
            eventsFlutterToast('All notes are empty');
          }
        })
  ];
  showCustomDialog(context, items);
}

void showClearRecentSearchDialog(BuildContext context, int index) {
  List<CustomDialogModel> items = [
    CustomDialogModel(
        title: 'Delete note',
        backgroundColor: const Color(0xffEB4D3D),
        image: Assets.imagesTrash,
        onTap: () async {
          GoRouter.of(context).pop();
          await context
              .read<SearchResultCubit>()
              .removeRecentSearch(index: index);
          eventsFlutterToast('Note Deleted');
        })
  ];
  showCustomDialog(context, items);
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:up_todo/core/utils/assets.dart';
import 'package:up_todo/core/utils/function/show_custom_dialog.dart';
import 'package:up_todo/features/events/presentation/manager/get_events/get_events_cubit.dart';
import 'package:up_todo/features/events/presentation/manager/remove_events/remove_events_cubit.dart';
import 'package:up_todo/features/events/presentation/widgets/function/events_flutter_toast.dart';

import '../../../features/notification/presentation/manager/notification/notification_cubit.dart';
import '../../models/custom_dialog_model.dart';

void showClearAllEventsDialog(BuildContext context) {
  var removeEvents = context.read<RemoveEventsCubit>();
  var cancelAllNotification = context.read<NotificationCubit>();
  var getEvents = context.read<GetEventsCubit>();

  List<CustomDialogModel> items = [
    CustomDialogModel(
        title: 'Delete all events',
        backgroundColor: const Color(0xffEB4D3D),
        image: Assets.imagesTrash,
        onTap: () async {
          GoRouter.of(context).pop();
          if(getEvents.events.isNotEmpty) {
            await cancelAllNotification.cancelAllNotification();
            await removeEvents.removeAllEvents();
            eventsFlutterToast('All events removed from the list');
          } else {
            eventsFlutterToast('All events are empty');
          }
          getEvents.getEvents();
        })
  ];
  showCustomDialog(context, items);
}

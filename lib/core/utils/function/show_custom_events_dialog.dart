import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:up_todo/core/utils/assets.dart';
import 'package:up_todo/features/events/presentation/manager/get_events/get_events_cubit.dart';
import 'package:up_todo/features/events/presentation/manager/remove_events/remove_events_cubit.dart';
import 'package:up_todo/features/events/presentation/widgets/function/events_flutter_toast.dart';

import '../../../features/notification/presentation/manager/notification/notification_cubit.dart';
import '../../models/custom_dialog_model.dart';
import 'show_custom_dialog.dart';

void showCustomEventsDialog(BuildContext context,
    {required int index, required int id}) {
  var clearNotification = context.read<NotificationCubit>();
  var removeEvent = context.read<RemoveEventsCubit>();
  var getEents = context.read<GetEventsCubit>();

  List<CustomDialogModel> items = [
    CustomDialogModel(
        title: 'Delete event',
        backgroundColor: const Color(0xffEB4D3D),
        image: Assets.imagesTrash,
        onTap: () async {
          GoRouter.of(context).pop();
          await clearNotification.cancelNotification(id: id);
          await removeEvent.removeEvent(eventID: index);
          eventsFlutterToast('Event Deleted');
          getEents.getEvents();
        })
  ];
  showCustomDialog(context, items);
}

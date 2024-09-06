import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:up_todo/core/utils/service/notification_service.dart';
import 'package:up_todo/features/events/data/models/notification_model.dart';

part 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit(this._notificationService) : super(NotificationInitial());

  final NotificationService _notificationService;
  Future<void> initNotification() async {
    await _notificationService.initNotification();
    await _notificationService.checkNotificationPermission();
    emit(InitNotificationSuccess());
  }

  Future<void> showNotification(
      {required NotificationModel notificationModel}) async {
    await _notificationService.showNotification(
        notificationModel: notificationModel);
  }
}

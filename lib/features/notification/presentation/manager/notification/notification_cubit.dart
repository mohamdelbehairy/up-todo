import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/notification_model.dart';
import '../../../data/repos/notification_repo.dart';

part 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit(this._notificationRepo) : super(NotificationInitial());

  final NotificationRepo _notificationRepo;
  Future<void> initNotification() async {
    await _notificationRepo.initNotification();
    await _notificationRepo.checkNotificationPermission();
    emit(InitNotificationSuccess());
  }

  Future<void> showNotification(
      {required NotificationModel notificationModel}) async {
    await _notificationRepo.showNotification(
        notificationModel: notificationModel);
    emit(ShowNotificationSuccess());
  }

  Future<void> cancelNotification({required int id}) async {
    await _notificationRepo.cancelNotification(id: id);
    emit(CancelNotificationSuccess());
  }

  Future<void> cancelAllNotification() async {
    await _notificationRepo.cancelAllNotification();
    emit(CancelAllNotificationSuccess());
  }
}

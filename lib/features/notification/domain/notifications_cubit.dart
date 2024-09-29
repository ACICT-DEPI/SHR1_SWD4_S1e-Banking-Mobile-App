import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../data/models/notification_model.dart';
import '../data/repo/notification_repo.dart';

part 'notifications_state.dart';

class NotificationsCubit extends Cubit<NotificationsState> {
  NotificationsCubit() : super(NotificationsInitial()) {
    initializeNotifications();
  }

  NotificationRepo notificationRepo = NotificationRepo();

  getAllNotifications() {
    notificationRepo.getAllNotifications();
    initializeNotifications();
  }

  removeAllNotifications() {
    notificationRepo.deleteAllNotifications();
    initializeNotifications();
  }

  initializeNotifications() {
    final notifications = notificationRepo.getAllNotifications();

    emit(NotificationsInitial());

    if (notifications.isEmpty) {
      emit(EmptyNotifications());
    } else if (notifications.isNotEmpty) {
      emit(NotificationsSuccess(notifications: notifications));
    } else {
      emit(NotificationsError(message: "Something went wrong"));
    }
  }
}

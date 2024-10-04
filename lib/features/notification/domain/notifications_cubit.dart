import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../data/models/notification_model.dart';
import '../data/repo/notification_repo.dart';

part 'notifications_state.dart';

class NotificationsCubit extends Cubit<NotificationsState> {
  NotificationsCubit() : super(NotificationsInitial()) {
    initializeNotifications();
  }

  final NotificationRepo _notificationRepo = NotificationRepo();

  getAllNotifications() async {
    await _notificationRepo.getAllNotifications();
    initializeNotifications();
  }

  removeAllNotifications() async {
    emit(NotificationsLoading());

    await _notificationRepo.deleteAllNotifications();
    initializeNotifications();
    emit(EmptyNotifications());
  }

  initializeNotifications() async {
    emit(NotificationsLoading());
    try {
      final notifications = await _notificationRepo.getAllNotifications();
      if (notifications.isEmpty) {
        emit(EmptyNotifications());
      } else if (notifications.isNotEmpty) {
        emit(NotificationsSuccess(notifications: notifications));
      }
    } catch (e) {
      emit(NotificationsError(message: e.toString()));
    }
  }
}

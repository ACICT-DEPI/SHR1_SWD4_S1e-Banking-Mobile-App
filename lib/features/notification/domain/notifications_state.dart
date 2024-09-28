part of 'notifications_cubit.dart';

@immutable
abstract class NotificationsState {}

class NotificationsInitial extends NotificationsState {}
class NotificationsLoaded extends NotificationsState {

  final List<NotificationModel> notifications;
  NotificationsLoaded({required this.notifications});
}
class NotificationsError extends NotificationsState {

  final String message;
  NotificationsError({required this.message});
}
class EmptyNotifications extends NotificationsState {}




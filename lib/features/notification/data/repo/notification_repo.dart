import '../../../../core/network/firebase_notifications.dart';

class NotificationRepo {
  getAllNotifications() async {
    return await FirebaseNotifications.getAllNotifications();
  }

  deleteAllNotifications() async {
    await FirebaseNotifications.removeAllNotifications();
  }
}

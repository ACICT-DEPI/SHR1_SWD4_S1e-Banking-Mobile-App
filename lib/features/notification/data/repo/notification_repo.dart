import '../../../../core/network/firebase_service.dart';

class NotificationRepo {
  getAllNotifications() async {
    return await FirebaseService.getAllNotifications();
  }

  deleteAllNotifications() async {
    await FirebaseService.removeAllNotifications();
  }
}

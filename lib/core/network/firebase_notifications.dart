import 'package:cloud_firestore/cloud_firestore.dart';

import '../../features/notification/data/models/notification_model.dart';
import 'firebase_authentication.dart';

class FirebaseNotifications {
  static final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  static final CollectionReference _userCollection =
      _fireStore.collection('users');

  static final String _userId = FirebaseAuthentication.getUserId();

  static final DocumentReference _userDocument = _userCollection.doc(_userId);

  static Future<void> addReceiveNotification(
      {required var notificationsCollection,
      required double amount,
      required String sender}) async {
    await notificationsCollection.add(
      NotificationModel.toJson(
        NotificationModel(
          title: "Payment Received",
          subtitle: "You received \$$amount from $sender",
          time: DateTime.now(),
        ),
      ),
    );
  }

  static Future<void> addNewNotification(
    NotificationModel notificationModel,
  ) async {
    await _userDocument.collection('notifications').add(
          NotificationModel.toJson(
            notificationModel,
          ),
        );
  }

  static Future<List<NotificationModel>> getAllNotifications() async {
    List<NotificationModel> allNotifications = [];

    final QuerySnapshot notificationsCollection =
        await _userDocument.collection('notifications').orderBy("time").get();

    for (var notificationDoc in notificationsCollection.docs) {
      allNotifications.add(
        NotificationModel.fromJson(
            notificationDoc.data() as Map<String, dynamic>),
      );
    }

    return allNotifications.reversed.toList();
  }

  static Future<void> removeAllNotifications() async {
    final QuerySnapshot notificationsCollection =
        await _userDocument.collection('notifications').get();

    for (QueryDocumentSnapshot doc in notificationsCollection.docs) {
      await doc.reference.delete();
    }
  }
}

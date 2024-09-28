import 'package:flutter/material.dart';

import '../models/notification_model.dart';

class NotificationRepo {

  final List<NotificationModel> notifications = [
    NotificationModel(
      title: "Payment Received",
      subtitle: "You received \$100 from Ahmed",
      time: "2 hours ago",
      icon: Icons.monetization_on,
    ),
    NotificationModel(
      title: "New Promotional Offer",
      subtitle: "Earn 5% cashback on all purchases",
      time: "Yesterday",
      icon: Icons.local_offer,
    ),
  ];

  getAllNotifications() {
    return notifications;
  }
  deleteAllNotifications() {
    notifications.clear();
  }





}
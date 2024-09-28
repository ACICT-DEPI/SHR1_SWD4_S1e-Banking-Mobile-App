import 'package:flutter/cupertino.dart';

class NotificationModel {
  final String title;
  final String subtitle;
  final String time;
  final IconData icon;

  NotificationModel({
    required this.title,
    required this.subtitle,
    required this.time,
    required this.icon,
  });
}

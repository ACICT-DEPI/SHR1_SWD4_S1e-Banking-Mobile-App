import 'package:flutter/material.dart';
import '../../../../../../../core/styles/colors.dart';
import '../../../../../../notification/data/models/notification_model.dart';

class NotificationContainer extends StatelessWidget {
  const NotificationContainer({
    super.key,
    required this.lastNotification,
  });

  final NotificationModel lastNotification;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20), // Smooth corners
        gradient: const LinearGradient(
          colors: [
            AppColors.blue,
            AppColors.lightBlue,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 2,
            offset: const Offset(0, 5), // Gentle shadow for depth
          ),
        ],
      ),
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Updated icon with modern colors
          const CircleAvatar(
            radius: 24,
            backgroundColor: Colors.white,
            child: Icon(
              Icons.notifications_active,
              color: AppColors.blue, // Deep teal for icon
              size: 28,
            ),
          ),
          const SizedBox(width: 16), // Space between icon and text
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  lastNotification.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  lastNotification.subtitle,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

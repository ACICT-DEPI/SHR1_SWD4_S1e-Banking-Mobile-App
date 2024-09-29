import 'package:flutter/material.dart';

import '../../../../core/styles/colors.dart';
import '../../../../core/styles/texts_style.dart';
import '../../data/models/notification_model.dart';

class NotificationCard extends StatelessWidget {
  final NotificationModel notification;

  const NotificationCard({super.key, required this.notification});

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: AppColors.greyA7,
      color: AppColors.white,
      // Card background color set to white
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: AppColors.lightGrey, width: 0.5),
        borderRadius: BorderRadius.circular(10.0),
      ),

      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        leading: CircleAvatar(
          radius: 24,
          backgroundColor: AppColors.white,
          // CircleAvatar background color set to white
          child: Icon(
            notification.icon,
            color: AppColors.blue,
          ), // Icon color changed to blue for contrast
        ),
        title: Text(
          notification.title,
          style: TextsStyle.textStyleSemiBold18.copyWith(
            color: AppColors.black,
          ), // Title color set to black
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 4.0),
          child: Text(
            notification.subtitle,
            style: TextsStyle.textStyleRegular14.copyWith(
              color: AppColors.black,
            ), // Subtitle color set to black
          ),
        ),
        trailing: Text(
          notification.time,
          style: TextsStyle.textStyleRegular12.copyWith(
            color: AppColors.greyA7,
          ), // Trailing time color kept grey
        ),
        onTap: () {
          // Handle tap on notification
        },
      ),
    );
  }
}

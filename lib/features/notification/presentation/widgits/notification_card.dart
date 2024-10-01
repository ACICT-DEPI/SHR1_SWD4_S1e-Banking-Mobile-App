import 'package:flutter/material.dart';

import '../../../../core/helpers/functions.dart';
import '../../../../core/local/local_settings.dart';
import '../../../../core/styles/colors.dart';
import '../../../../core/styles/texts_style.dart';
import '../../../../generated/l10n.dart';
import '../../data/models/notification_model.dart';

class NotificationCard extends StatelessWidget {
  final NotificationModel notification;

  const NotificationCard({super.key, required this.notification});

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: AppColors.greyA7,
      color: (LocalSettings.getSettings().themeMode == S.of(context).Light)
          ? AppColors.white
          : AppColors.dark,
      // Card background color set to white
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),

      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        leading: Icon(
          Functions.getNotificationIcon(notification.title),
          color: AppColors.blue,
        ),
        title: Text(
          notification.title,
          style: TextsStyle.textStyleSemiBold18,
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 4.0),
          child: Text(
            notification.subtitle,
            style: TextsStyle.textStyleRegular14,
          ),
        ),
        trailing: Text(
          Functions.timeAgo(notification.time, context),
          style: TextsStyle.textStyleRegular12,
        ),
      ),
    );
  }
}

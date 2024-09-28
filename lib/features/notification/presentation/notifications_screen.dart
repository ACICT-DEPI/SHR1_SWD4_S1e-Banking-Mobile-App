import 'package:bank_app/core/Routing/Routing.dart';
import 'package:bank_app/core/widgets/error_screen.dart';
import 'package:bank_app/features/notification/presentation/widgits/notification_appbar.dart';
import 'package:bank_app/features/notification/presentation/widgits/notification_card.dart';
import 'package:flutter/material.dart';
import 'package:bank_app/core/styles/texts_style.dart';
import 'package:bank_app/core/styles/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/widgets/loading_screen.dart'; // Corrected case
import '../data/models/notification_model.dart';
import '../domain/notifications_cubit.dart';

class NotificationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Trigger fetching notifications once when the screen is built
    BlocProvider.of<NotificationsCubit>(context).getAllNotifications();

    return BlocConsumer<NotificationsCubit, NotificationsState>(
      listener: (context, state) {
        if (state is NotificationsError) {
          // Navigate to the error screen if there's an error
          context.go(Routing.errorScreen, extra: ErrorScreenData(
            message: state.message,
            onPressed: () {
              Navigator.pop(context);
            },
          ));
        }
      },
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const SizedBox(height: 16.0),
                  NotificationAppBar(
                    title: 'Notifications',
                    onarrowPressed: () {
                      context.pop();
                    },
                    onClearAllPressed: () {
                      // Clear all notifications when button is pressed
                      BlocProvider.of<NotificationsCubit>(context)
                          .removeAllNotifications();
                    },
                  ),
                  const SizedBox(height: 16.0),
                  Expanded(
                    // Build the list of notifications
                    child: BlocBuilder<NotificationsCubit, NotificationsState>(
                      builder: (context, state) {
                        if (state is NotificationsInitial) {
                          return const LoadingScreen();
                        } else if (state is NotificationsLoaded) {
                          List<NotificationModel> notifications = state.notifications;
                          return ListView.builder(
                            itemCount: notifications.length,
                            itemBuilder: (context, index) {
                              // Return a NotificationCard for each notification
                              return NotificationCard(
                                notification: notifications[index],
                              );
                            },
                          );
                        } else if (state is NotificationsError) {
                          return ErrorScreen(
                            message: state.message,
                          );
                        } else if (state is EmptyNotifications) {
                          return const Center(
                            child: Text("No Notifications"),
                          );
                        } else {
                          return const Center(child: Text("Unknown state"));
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

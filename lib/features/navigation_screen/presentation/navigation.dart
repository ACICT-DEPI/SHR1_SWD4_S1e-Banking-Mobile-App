import 'package:bank_app/core/local/local_settings.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inapp_notifications/flutter_inapp_notifications.dart';
import 'package:go_router/go_router.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import '../../../core/Routing/Routing.dart';
import '../../../core/network/firebase_authentication.dart';
import '../../../core/network/firebase_notifications.dart';
import '../../../core/styles/colors.dart';
import '../../notification/data/models/notification_model.dart';
import '../../settings/presentation/views/settings.dart';
import '../../statistics/presentation/views/statistics_view.dart';
import '../../wifi_screen/Logic/conection_cubit.dart';
import '../../wifi_screen/Logic/conection_state.dart';
import '../logic/home_screen_cubit.dart';
import 'cards_screen/cards_screen.dart';
import 'home/presentation/views/home_screen.dart';
import 'home/presentation/views/widgets/custom_navigation_bar.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int pageIndex = 0;
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    await Future.delayed(const Duration(milliseconds: 800));
    context.read<HomeScreenCubit>().initialize();
    _refreshController.refreshCompleted();
  }

  String userId = FirebaseAuthentication.getUserId();

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      const HomeScreen(),
      const CardsScreen(),
      const StatisticsView(),
      const Setting(),
    ];
    bool isThemeLight = LocalSettings.getSettings().themeMode == 'Light' ||
        LocalSettings.getSettings().themeMode == 'فاتح';

    InAppNotifications.instance
      ..textColor = isThemeLight ? AppColors.dark : AppColors.white
      ..backgroundColor = isThemeLight ? AppColors.white : AppColors.dark;

    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('users')
              .doc(userId)
              .collection('notifications')
              .orderBy("time")
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<NotificationModel> allNotifications = snapshot.data!.docs
                  .map((doc) => NotificationModel.fromJson(doc))
                  .toList();
              if (allNotifications.isNotEmpty) {
                if (!allNotifications.last.isAppear) {
                  InAppNotifications.show(
                      title: allNotifications.last.title,
                      leading: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          backgroundColor: AppColors.blue,
                          child: Icon(Icons.notifications_active,
                              color: Colors.white, size: 24.0),
                        ),
                      ),
                      duration: const Duration(seconds: 10),
                      description: allNotifications.last.subtitle,
                      onTap: () {
                        GoRouter.of(context).push(Routing.notificationsScreen);
                      });
                  allNotifications.last.isAppear = true;
                  FirebaseNotifications.updateNotification(
                    allNotifications.last,
                  );
                }
              }
            }
            return BlocBuilder<ConnectionScreenCubit, WifiState>(
              builder: (context, state) {
                if (state is Connected) {
                  // Handle connected state if needed
                }
                return SafeArea(
                  child: SmartRefresher(
                    header: const MaterialClassicHeader(
                      color: AppColors.blue,
                    ),
                    controller: _refreshController,
                    onRefresh: _onRefresh,
                    enablePullDown: true,
                    enablePullUp: false,
                    physics: const BouncingScrollPhysics(),
                    child: screens[pageIndex],
                  ),
                );
              },
            );
          }),
      bottomNavigationBar: CustomNavigationBar(
        bottomNavIndex: pageIndex,
        onTap: (int newIndex) {
          setState(() {
            pageIndex = newIndex;
          });
        },
      ),
    );
  }
}

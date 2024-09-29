import 'package:bank_app/features/navigation_screen/logic/home_screen_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import '../../../core/styles/colors.dart';
import '../../settings/presentation/views/settings.dart';
import '../../statistics/presentation/views/statistics_view.dart';
import '../../wifi_screen/Logic/conection_cubit.dart';
import '../../wifi_screen/Logic/conection_state.dart';
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
    await Future.delayed(const Duration(milliseconds: 1000));
    context.read<HomeScreenCubit>().initialize();
    _refreshController.refreshCompleted();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      const HomeScreen(),
      const CardsScreen(),
      const StatisticsView(),
      const Setting(),
    ];

    return Scaffold(
      body: BlocBuilder<ConnectionScreenCubit, WifiState>(
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
      ),
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

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

          }
          return SafeArea(
            child: screens[pageIndex],
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

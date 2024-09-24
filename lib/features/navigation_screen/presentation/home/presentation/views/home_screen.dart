import 'package:bank_app/core/Routing/Routing.dart';
import 'package:bank_app/features/navigation_screen/presentation/home/presentation/views/widgets/home_screen_loade_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../core/widgets/error_screen.dart';
import '../../../../../../core/widgets/Loading_screen.dart';
import '../../../../logic/home_screen_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final PageController _pageController;
  int _selectedCardIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenCubit, HomeScreenState>(
      builder: (context, state) {
        if (state is HomeScreenSuccess) {
          return HomeScreenLoadedWidget(
            state: state,
            pageController: _pageController,
            selectedCardIndex: _selectedCardIndex,
            onPageChanged: (index) {
              setState(() {
                _selectedCardIndex = index;
              });
            },
            onNavigateToSearch: _navigateToSearch,
            onNavigateToSendMoney: _navigateToSendMoney,
            onNavigateToReceiveMoney: _navigateToReceiveMoney,
          );
        } else if (state is HomeScreenError) {
          return ErrorScreen(message: state.message);
        } else {
          return const LoadingScreen();
        }
      },
    );
  }

  void _navigateToSearch() {
    GoRouter.of(context).push(Routing.searchView);
  }

  void _navigateToSendMoney() {
    GoRouter.of(context).push(Routing.sendMoneyScreen);
  }

  void _navigateToReceiveMoney() {
    GoRouter.of(context).push(Routing.receiveMoneyView);
  }
}

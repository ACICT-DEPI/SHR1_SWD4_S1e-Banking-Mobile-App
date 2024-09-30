import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../core/Routing/Routing.dart';
import '../../../../../../core/widgets/error_screen.dart';
import '../../../../../../core/widgets/Loading_screen.dart';
import '../../../../logic/home_screen_cubit.dart';
import 'widgets/home_screen_loaded_widget.dart';

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
    return BlocListener<HomeScreenCubit, HomeScreenState>(
      listener: (context, state) {
        if (state is HomeScreenError) {
          context.go(
            Routing.errorScreen,
            extra: ErrorScreenData(
              message: "An error occurred",
              onPressed: () {
                context.go(Routing.navigationScreen); // Navigate to the next screen
              },
            ),
          );
        }
      },
      child: BlocBuilder<HomeScreenCubit, HomeScreenState>(
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
              onNavigateToService: _navigateToService,
            );
          } else {
            return const LoadingScreen();
          }
        },
      ),
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

  void _navigateToService() {
    GoRouter.of(context).push(Routing.servicesView);
  }
}

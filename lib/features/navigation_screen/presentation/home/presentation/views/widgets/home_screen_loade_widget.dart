import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../statistics/presentation/views/widgets/transaction_section.dart';
import '../../../../../data/models/card_model.dart';
import '../../../../../logic/home_screen_cubit.dart';
import 'bank_card_design.dart';
import 'build_actions_row.dart';
import 'home_page_app_bar.dart';


class HomeScreenLoadedWidget extends StatelessWidget {
  final HomeScreenLoaded state;
  final PageController pageController;
  final int selectedCardIndex;
  final void Function(int) onPageChanged;
  final VoidCallback onNavigateToSearch;
  final VoidCallback onNavigateToSendMoney;

  const HomeScreenLoadedWidget({
    Key? key,
    required this.state,
    required this.pageController,
    required this.selectedCardIndex,
    required this.onPageChanged,
    required this.onNavigateToSearch,
    required this.onNavigateToSendMoney,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          HomePageAppBarDesign(
            username: state.userModel.fullName,
            imagePath: 'assets/images/person.png',
            onSearchPressed: onNavigateToSearch,
          ),
          const SizedBox(height: 15),
          Expanded(
            child: ListView(
              children: [
                _buildCardSection(state.cards),
                const SizedBox(height: 15),
                BuildActionsRow(
                  onPressedSent: onNavigateToSendMoney,
                  onPressedReceive: onNavigateToSendMoney,
                  onPressedLoan: onNavigateToSendMoney,
                  onPressedTopUp: onNavigateToSendMoney,
                ),
                const SizedBox(height: 26),
                const TransactionSection(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCardSection(List<CardModel> cards) {
    return SizedBox(
      width: double.infinity,
      height: 220,
      child: PageView.builder(
        controller: pageController,
        itemCount: cards.length,
        onPageChanged: onPageChanged,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: BankCardDesign(card: cards[index]),
          );
        },
      ),
    );
  }
}

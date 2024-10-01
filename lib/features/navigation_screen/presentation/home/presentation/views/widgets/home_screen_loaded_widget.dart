import 'package:flutter/material.dart';

import '../../../../../../statistics/presentation/views/widgets/transaction_section.dart';
import '../../../../../data/models/card_model.dart';
import '../../../../../logic/home_screen_cubit.dart';
import 'bank_card_design.dart';
import 'build_actions_row.dart';
import 'home_page_app_bar.dart';

class HomeScreenLoadedWidget extends StatelessWidget {
  final HomeScreenSuccess state;
  final PageController pageController;
  final int selectedCardIndex;
  final void Function(int) onPageChanged;
  final VoidCallback onNavigateToSearch;
  final VoidCallback onNavigateToSendMoney;
  final VoidCallback onNavigateToReceiveMoney;
  final VoidCallback onNavigateToService;

  const HomeScreenLoadedWidget({
    super.key,
    required this.state,
    required this.pageController,
    required this.selectedCardIndex,
    required this.onPageChanged,
    required this.onNavigateToSearch,
    required this.onNavigateToSendMoney,
    required this.onNavigateToReceiveMoney,
    required this.onNavigateToService,
  });

  @override
  Widget build(BuildContext context) {
    final double heightFactor = MediaQuery.of(context).size.height / 890;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          HomePageAppBarDesign(
            name: state.homeModel.userModel.fullName,
            imagePath: state.homeModel.userModel.image!,
            onSearchPressed: onNavigateToSearch,
          ),
          const SizedBox(height: 18),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              children: [
                _buildCardSection(state.homeModel.cards, heightFactor),
                BuildActionsRow(
                  onPressedSent: onNavigateToSendMoney,
                  onPressedReceive: onNavigateToReceiveMoney,
                  onPressedTopUp: onNavigateToService,
                ),
                const SizedBox(height: 28.0),
                if (state.homeModel.transactions.isNotEmpty) ...[
                  TransactionSection(
                    transactions: state.homeModel.transactions,
                  ),
                ]
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCardSection(List<CardModel> cards, double heightFactor) {
    return SizedBox(
      width: double.infinity,
      height: 240 * heightFactor,
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

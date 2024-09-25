import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/widgets/Loading_screen.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/error_screen.dart';
import '../../../all_cards_screen/presentation/views/all_cards_screen.dart';
import '../../../statistics/presentation/views/widgets/transaction_section.dart';
import '../../logic/home_screen_cubit.dart';
import '../home/presentation/views/widgets/bank_card_design.dart';
import 'widgets/spending_limit_section.dart';

class CardsScreen extends StatefulWidget {
  const CardsScreen({super.key});

  @override
  State<CardsScreen> createState() => _CardsScreenState();
}

class _CardsScreenState extends State<CardsScreen> {
  int selectedCardIndex = 0;

  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
  //  final double widthFactor = MediaQuery.of(context).size.width/411;
    final double heightFactor = MediaQuery.of(context).size.height/890;

    return BlocBuilder<HomeScreenCubit, HomeScreenState>(
      builder: (context, state) {
        if (state is HomeScreenSuccess) {
          final cards = state.homeModel.cards;
          return Padding(
            padding: const EdgeInsets.only(top: 20.0, right: 20.0, left: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // AppBar Section (Header remains fixed)
                CustomAppBar(
                  appBarTitle: "My Cards",
                  rightIcon: Icons.add,
                  onPressedRight: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AllCardsScreen(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 30),
                Expanded(
                  child: ListView(
                    children: [
                      // Card Section
                      SizedBox(
                        width: double.infinity, // Adjust to your needs
                        height: 300*heightFactor,
                        child: PageView.builder(
                          controller: pageController,
                          itemCount: cards.length,
                          itemBuilder: (context, index) {
                            final card = cards[index];
                            return Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: BankCardDesign(
                                card: card,
                              ),
                            );
                          },
                          onPageChanged: (index) {
                            setState(() {
                              selectedCardIndex = index;
                            });
                          },
                        ),
                      ),

                      const SizedBox(height: 20),
                      // Transactions Section
                      TransactionSection(
                        transactions: state.homeModel.transactions,
                      ),
                      // Spending Limit Section
                      const SpendingLimitSection(),
                    ],
                  ),
                ),
              ],
            ),
          );
        } else if (state is HomeScreenError) {
          return ErrorScreen(message: state.message);
        } else {
          return const LoadingScreen();
        }
      },
    );
  }
}

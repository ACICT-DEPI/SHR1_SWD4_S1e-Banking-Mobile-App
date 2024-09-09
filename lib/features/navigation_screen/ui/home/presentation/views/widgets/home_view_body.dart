import 'package:bank_app/core/styles/colors.dart';
import 'package:flutter/material.dart';
import '../../../../../../statistics/presentation/views/widgets/transaction_section.dart';
import 'BankCardDesign.dart';
import 'BuildActionsRow.dart';
import 'HomePageAppbarDesign.dart';

class HomeViewBody extends StatefulWidget {

  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomePageAppBarDesign(),
      backgroundColor: AppColors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Card Section
              const BankCardDesign(
                cardNumber: "4562 1122 4595 7852",
                cardHolderName: "AR Jonson",
                expiryDate: "24/2000",
                cvv: "6986",
                cardType: "Mastercard",
              ),
              // Action buttons
              BuildActionsRow(
                onPressedSent: () {},
                onPressedReceive: () {},
                onPressedLoan: () {},
                onPressedTopUp: () {},
              ),
              const SizedBox(height: 26),
              // Transactions
              const TransactionSection()
            ],
          ),
        ),
      ),

    );
  }
}

import 'package:bank_app/core/styles/colors.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


import '../../../../../../statistics/presentation/views/widgets/transaction_section.dart';
import 'BankCardDesign.dart';
import 'BuildActionsRow.dart';
import 'CustomNavigationBar.dart';
import 'HomePageAppbarDesign.dart';

class HomeViewBody extends StatelessWidget {
  int PageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomNavigationBar(bottomNavIndex:PageIndex, onTap: (int value) {  } ,),
      backgroundColor: AppColors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Card Section
              BankCardDesign(
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
              SizedBox(height: 26),
              // Transactions
              TransactionSection()
            ],
          ),
        ),
      ),

    );
  }
}

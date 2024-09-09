import 'package:flutter/material.dart';
import 'package:bank_app/core/styles/colors.dart';

import '../../../../../core/styles/texts_style.dart';

class CardsPageHeader extends StatelessWidget {
  const CardsPageHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Back button
          IconButton(
            icon: const Icon(Icons.arrow_back, color:AppColors.black ,size: 30,),
            onPressed: () {
              Navigator.pop(context);
            },
          ),

          // Title
           Text(
            "My Cards",
            style: TextsStyle.textStyleMedium18.copyWith(color: AppColors.black, fontWeight: FontWeight.bold),
          ),

          // Add button
          IconButton(
            icon: const Icon(Icons.add, color: AppColors.black, size: 30),
            onPressed: () {
              // Add card action
            },
          ),
        ],
      ),
    );
  }
}

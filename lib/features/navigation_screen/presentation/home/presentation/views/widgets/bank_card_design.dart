import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:bank_app/core/styles/colors.dart';
import 'package:bank_app/core/styles/texts_style.dart';

import '../../../../../../add_new_card_page/presentation/widgets/card_type_detector.dart';
import '../../../../../data/models/card_model.dart';


class BankCardDesign extends StatelessWidget {
  final CardModel card;

  const BankCardDesign({
    super.key,
    required this.card,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 240,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        image: const DecorationImage(
          image: AssetImage("assets/images/CardBackground.png"),
          fit: BoxFit.fitWidth,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset("assets/images/chip_1.svg"),
                SvgPicture.asset("assets/images/nfc.svg"),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  card.cardNumber,
                  style: TextsStyle.textStyleRegular24.copyWith(
                    color: Colors.white,
                    letterSpacing: 2.0,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  card.cardHolderName,
                  style: TextsStyle.textStyleRegular13.copyWith(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Expiry Date:",
                          style: TextsStyle.textStyleRegular9.copyWith(
                            color: AppColors.grey8D,
                          ),
                        ),
                        Text(
                          card.expiryDate,
                          style: TextsStyle.textStyleRegular13.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "CVV:",
                          style: TextsStyle.textStyleRegular9.copyWith(
                            color: AppColors.grey8D,
                          ),
                        ),
                        Text(
                          card.cvv,
                          style: TextsStyle.textStyleRegular13.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                CardInfoWidget(cardNumber: card.cardNumber,)
              ],
            ),
            const SizedBox(width: 5),
          ],
        ),
      ),
    );
  }
}

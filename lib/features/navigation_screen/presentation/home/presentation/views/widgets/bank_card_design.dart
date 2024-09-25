import 'package:auto_size_text_pk/auto_size_text_pk.dart';
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
    final double widthFactor = MediaQuery.of(context).size.width / 411;
    final double heightFactor = MediaQuery.of(context).size.height / 890;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25 * widthFactor),
        // Adjusted border radius
        image: const DecorationImage(
          image: AssetImage("assets/images/CardBackground.png"),
          fit: BoxFit.fitWidth,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16 * widthFactor, // Adjusted horizontal padding
          vertical: 0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20 * heightFactor), // Adjusted vertical space
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(
                  "assets/images/chip_1.svg",
                ),
                SvgPicture.asset(
                  "assets/images/nfc.svg",
                ),
              ],
            ),
            SizedBox(height: 20 * heightFactor), // Adjusted vertical space
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 300 * widthFactor, // Adjusted width
                  child: AutoSizeText(
                    card.cardNumber,
                    style: TextsStyle.textStyleRegular24.copyWith(
                      color: Colors.white,
                      letterSpacing: 2.0,
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 1,
                  ),
                ),
              ],
            ),
            SizedBox(height: 25 * heightFactor), // Adjusted vertical space
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 100 * widthFactor, // Adjusted width
                  child: AutoSizeText(
                    card.cardHolderName,
                    style: TextsStyle.textStyleRegular13.copyWith(
                      color: Colors.white,
                    ),
                    maxLines: 1,
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
                        SizedBox(
                          width: 80 * widthFactor, // Adjusted width
                          child: AutoSizeText(
                            "Expiry Date:",
                            style: TextsStyle.textStyleRegular9.copyWith(
                              color: AppColors.grey8D,
                            ),
                            maxLines: 1,
                          ),
                        ),
                        SizedBox(
                          width: 80 * widthFactor, // Adjusted width
                          child: AutoSizeText(
                            card.expiryDate,
                            style: TextsStyle.textStyleRegular13.copyWith(
                              color: Colors.white,
                            ),
                            maxLines: 1,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 20 * widthFactor),
                    // Adjusted horizontal space
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 80 * widthFactor, // Adjusted width
                          child: AutoSizeText(
                            maxLines: 1,
                            "CVV:",
                            style: TextsStyle.textStyleRegular9.copyWith(
                              color: AppColors.grey8D,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 80 * widthFactor, // Adjusted width
                          child: AutoSizeText(
                            maxLines: 1,
                            card.cvv,
                            style: TextsStyle.textStyleRegular13.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                CardInfoWidget(
                  cardNumber: card.cardNumber,
                ),
              ],
            ),
            SizedBox(height: 20 * heightFactor), // Adjusted horizontal space
          ],
        ),
      ),
    );
  }
}

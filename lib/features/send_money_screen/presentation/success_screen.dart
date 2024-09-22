import 'package:bank_app/core/Routing/Routing.dart';
import 'package:bank_app/core/styles/colors.dart';
import 'package:bank_app/core/widgets/custom_app_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import '../../../core/styles/texts_style.dart';
import '../data/models/success_model.dart';

class SuccessScreen extends StatelessWidget {
  final SuccessModel successModel;

  SuccessScreen({required this.successModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Success Icon Animation
            Lottie.asset('assets/images/success.json', width: 150, height: 150),
            SizedBox(height: 16),

            // Transaction Status Message
            Text(
              'Transaction Successful',
              style:
              TextsStyle.textStyleSemiBold24.copyWith(color: Colors.black),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),

            // Transferred Amount with currency
            Text(
              '${successModel.amount} ${successModel.currencyType}',
              style: TextsStyle.textStyleSemiBold24.copyWith(
                  color: Colors.black, fontSize: 36),
            ),
            Text(
              'Total amount transferred',
              style: TextsStyle.textStyleRegular15.copyWith(
                  color: AppColors.greyA7, fontSize: 18),
            ),
            SizedBox(height: 20),

            // Sender Information Section
            Row(
              children: [
                Icon(Icons.person_outline, color: Colors.green, size: 32), // أيقونة المرسل
                SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      successModel.senderName,
                      style: TextsStyle.textStyleMedium18,
                    ),
                    Text(
                      "ID: "+ successModel.senderId,
                      style: TextsStyle.textStyleRegular15
                          .copyWith(color: AppColors.greyA7),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16),

            // Receiver Information Section
            Row(
              children: [
                Icon(Icons.person, color: Colors.blue, size: 32), // أيقونة المستلم
                SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      successModel.receiverName,
                      style: TextsStyle.textStyleMedium18,
                    ),
                    Text(
                      "ID: "+successModel.receiverId,
                      style: TextsStyle.textStyleRegular15
                          .copyWith(color: AppColors.greyA7),
                    ),
                    Text(
                      "phone: "+successModel.receiverPhone,
                      style: TextsStyle.textStyleRegular15
                          .copyWith(color: AppColors.greyA7),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),

            // Transaction Details Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Reference',
                      style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                    ),
                    Text(
                      successModel.referenceNumber,
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Date',
                      style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                    ),
                    Text(
                      successModel.date,
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),

            // Back to Home Button
            CustomAppButton(title: "Back to Home", onPressed: () {
              context.pop();
            }),
          ],
        ),
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/styles/colors.dart';
import '../../../../core/styles/texts_style.dart';
import '../../../../core/widgets/custom_app_button.dart';
import '../../data/models/success_model.dart';

class SuccessSendingScreenBody extends StatelessWidget {
  final SuccessModel successModel;

  const SuccessSendingScreenBody({super.key, required this.successModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Success Icon Animation
          Lottie.asset('assets/images/success.json', width: 150, height: 150),
          const SizedBox(height: 16),

          // Transaction Status Message
          Text(
            'Transaction Successful',
            style: TextsStyle.textStyleSemiBold24.copyWith(color: Colors.black),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),

          // Transferred Amount with currency
          Text(
            '${successModel.amount} ${successModel.currencyType}',
            style: TextsStyle.textStyleSemiBold24
                .copyWith(color: Colors.black, fontSize: 36),
          ),
          Text(
            'Total amount transferred',
            style: TextsStyle.textStyleRegular15
                .copyWith(color: AppColors.greyA7, fontSize: 18),
          ),
          const SizedBox(height: 40),

          // Sender Information Section
          Row(
            children: [
              const Icon(Icons.person_outline, color: Colors.green, size: 32),
              // أيقونة المرسل
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    successModel.senderName,
                    style: TextsStyle.textStyleMedium18,
                  ),
                  Text(
                    "ID: ${successModel.senderId}",
                    style: TextsStyle.textStyleRegular15
                        .copyWith(color: AppColors.greyA7),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Receiver Information Section
          Row(
            children: [
              const Icon(Icons.person, color: Colors.blue, size: 32),
              // أيقونة المستلم
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    successModel.receiverName,
                    style: TextsStyle.textStyleMedium18,
                  ),
                  Text(
                    "ID: ${successModel.receiverId}",
                    style: TextsStyle.textStyleRegular15
                        .copyWith(color: AppColors.greyA7),
                  ),
                  Text(
                    "phone: ${successModel.receiverPhone}",
                    style: TextsStyle.textStyleRegular15
                        .copyWith(color: AppColors.greyA7),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 40),

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
                    "#${successModel.referenceNumber}",
                    style: TextsStyle.textStyleSemiBold18,
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
                    "${successModel.date.year}/${successModel.date.month}/${successModel.date.day} ${successModel.date.hour}:${successModel.date.minute}",
                    style: TextsStyle.textStyleSemiBold18,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 25),

          // Back to Home Button
          CustomAppButton(
            title: "Back to Home",
            onPressed: () {
              GoRouter.of(context).pop();
              GoRouter.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}

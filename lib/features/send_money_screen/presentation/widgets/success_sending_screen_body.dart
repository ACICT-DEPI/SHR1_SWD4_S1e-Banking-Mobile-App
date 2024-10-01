import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:auto_size_text/auto_size_text.dart'; // Import the package

import '../../../../core/styles/colors.dart';
import '../../../../core/styles/texts_style.dart';
import '../../../../core/widgets/custom_app_button.dart';
import '../../../navigation_screen/logic/home_screen_cubit.dart';
import '../../../statistics/domain/cubits/statistics_cubit/statistics_cubit.dart';
import '../../data/models/success_model.dart';

class SuccessSendingScreenBody extends StatelessWidget {
  final SuccessModel successModel;

  const SuccessSendingScreenBody({super.key, required this.successModel});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width / 400;
    final height = MediaQuery.of(context).size.height / 900;
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Success Icon Animation
          Lottie.asset('assets/images/success.json', width: 150, height: 150),
          SizedBox(height: 16 * height),

          // Transaction Status Message
          AutoSizeText(
            'Transaction Successful',
            style: TextsStyle.textStyleSemiBold24.copyWith(color: Colors.black),
            textAlign: TextAlign.center,
            maxLines: 1,
          ),
          SizedBox(height: 16 * height),

          // Transferred Amount with currency
          SizedBox(
            width: 300 * width,
            child: AutoSizeText(
              '${successModel.amount.toStringAsFixed(2)} ${successModel.currencyType}',
              textAlign: TextAlign.center,
              style: TextsStyle.textStyleSemiBold24
                  .copyWith(color: Colors.black, fontSize: 36),
              maxLines: 1,
            ),
          ),
          SizedBox(
            width: 300 * width,
            child: AutoSizeText(
              textAlign: TextAlign.center,
              'Total amount transferred',
              style: TextsStyle.textStyleRegular15
                  .copyWith(color: AppColors.greyA7, fontSize: 18),
              maxLines: 1,
            ),
          ),
          const SizedBox(height: 40),

          // Sender Information Section
          Row(
            children: [
              const Icon(Icons.person_outline, color: Colors.green, size: 32),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 300 * width,
                    child: AutoSizeText(
                      successModel.senderName,
                      style: TextsStyle.textStyleMedium18,
                      maxLines: 1,
                    ),
                  ),
                  SizedBox(
                    width: 300 * width,
                    child: AutoSizeText(
                      "ID: ${successModel.senderId}",
                      style: TextsStyle.textStyleRegular15
                          .copyWith(color: AppColors.greyA7),
                      maxLines: 1,
                    ),
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
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 300 * width,
                    child: AutoSizeText(
                      successModel.receiverName,
                      style: TextsStyle.textStyleMedium18,
                      maxLines: 1,
                    ),
                  ),
                  SizedBox(
                    width: 300 * width,
                    child: AutoSizeText(
                      "ID: ${successModel.receiverId}",
                      style: TextsStyle.textStyleRegular15
                          .copyWith(color: AppColors.greyA7),
                      maxLines: 1,
                    ),
                  ),
                  SizedBox(
                    width: 300 * width,
                    child: AutoSizeText(
                      "phone: ${successModel.receiverPhone}",
                      style: TextsStyle.textStyleRegular15
                          .copyWith(color: AppColors.greyA7),
                      maxLines: 1,
                    ),
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
                  SizedBox(
                    width: 150 * width,
                    child: AutoSizeText(
                      'Reference',
                      style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                      maxLines: 1,
                    ),
                  ),
                  AutoSizeText(
                    "#${successModel.referenceNumber}",
                    style: TextsStyle.textStyleSemiBold18,
                    maxLines: 1,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 150 * width,
                    child: AutoSizeText(
                      'Date',
                      style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                      maxLines: 1,
                    ),
                  ),
                  SizedBox(
                    width: 150 * width,
                    child: AutoSizeText(
                      "${successModel.date.year}/${successModel.date.month}/${successModel.date.day} ${successModel.date.hour}:${successModel.date.minute}",
                      style: TextsStyle.textStyleSemiBold18,
                      maxLines: 1,
                    ),
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
              BlocProvider.of<HomeScreenCubit>(context).initialize();
              BlocProvider.of<StatisticsCubit>(context).initialize(context);
              GoRouter.of(context).pop();
              GoRouter.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}

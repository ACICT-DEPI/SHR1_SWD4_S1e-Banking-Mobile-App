import 'package:flutter/material.dart';

import '../../../../core/styles/colors.dart';
import '../../../../core/styles/texts_style.dart';
import '../../../../generated/l10n.dart';

class SendMoneyTextField extends StatefulWidget {
  final TextEditingController textController;

  const SendMoneyTextField({super.key, required this.textController});

  @override
  State<SendMoneyTextField> createState() => _SendMoneyTextFieldState();
}

class _SendMoneyTextFieldState extends State<SendMoneyTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.lightGrey,
        ),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                S.of(context).EnterAmount,
                style: TextsStyle.textStyleRegular12.copyWith(
                  color: AppColors.grey94,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  S.of(context).ChangeCurrency,
                  style: TextsStyle.textStyleRegular12.copyWith(
                    color: AppColors.red,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          Row(
            children: <Widget>[
              Text(
                "USD",
                style: TextsStyle.textStyleSemiBold24.copyWith(
                  color: AppColors.grey94,
                ),
              ),
              const SizedBox(width: 16.0),
              Expanded(
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return S.of(context).EnterAmount;
                    }
                    return null;
                  },
                  controller: widget.textController,
                  cursorColor: AppColors.blue,
                  decoration: InputDecoration(
                    hintStyle: TextsStyle.textStyleRegular12.copyWith(
                      color: AppColors.grey94,
                    ),
                    counterStyle: TextsStyle.textStyleSemiBold24.copyWith(
                      color: AppColors.black,
                    ),
                    border: InputBorder.none,
                  ),
                  style: TextsStyle.textStyleSemiBold24,
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8.0),
        ],
      ),
    );
  }
}

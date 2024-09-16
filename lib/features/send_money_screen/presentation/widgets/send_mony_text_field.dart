import 'package:flutter/material.dart';
import 'package:bank_app/core/styles/colors.dart';
import 'package:bank_app/core/styles/texts_style.dart';

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
      padding: const EdgeInsets.all(16.0),
      height: 140,
      width: 360,
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
                "Enter amount",
                style: TextsStyle.textStyleRegular12.copyWith(
                  color: AppColors.grey94,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  "Change Currency?",
                  style: TextsStyle.textStyleRegular12.copyWith(
                    color: AppColors.red,
                  ),
                ),
              ),
            ],
          ),
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
                child: TextField(
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
                  style: TextsStyle.textStyleSemiBold24.copyWith(
                    color: AppColors.black,
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

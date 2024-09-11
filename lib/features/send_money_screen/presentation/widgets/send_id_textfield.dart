import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bank_app/core/styles/colors.dart';
import 'package:bank_app/core/styles/texts_style.dart';

class SendIdTextField extends StatefulWidget {
  TextEditingController textController ;

   SendIdTextField({super.key, required this.textController});

  @override
  State<SendIdTextField> createState() => _SendIdTextFieldState();
}

class _SendIdTextFieldState extends State<SendIdTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      height: 120,
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
                "Enter ID",
                style: TextsStyle.textStyleRegular12.copyWith(
                  color: AppColors.grey94,
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Text(
                "ID",
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
                    suffixIcon: IconButton(
                      iconSize: 40,
                      style: const ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(
                          AppColors.white,
                        ),
                      ),
                      onPressed: () {
                        // Your onPressed logic
                      },
                      icon: Icon(
                        Icons.qr_code,
                        color: AppColors.blue,
                      ),
                    ),
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

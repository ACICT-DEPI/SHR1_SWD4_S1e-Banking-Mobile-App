import 'package:flutter/material.dart';

import '../../../../core/local/local_settings.dart';
import '../../../../core/styles/colors.dart';
import '../../../../core/styles/texts_style.dart';
import '../../../../generated/l10n.dart';

class AmountTextField extends StatefulWidget {
  final TextEditingController textController;

  const AmountTextField({super.key, required this.textController});

  @override
  State<AmountTextField> createState() => _AmountTextFieldState();
}

class _AmountTextFieldState extends State<AmountTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
        border: Border.all(
          color: (LocalSettings.getSettings().themeMode == "Light" ||
                  LocalSettings.getSettings().themeMode == "فاتح")
              ? AppColors.lightGrey
              : AppColors.dark,
        ),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                      return S.of(context).EnterTheAmount;
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
                  style: TextsStyle.textStyleSemiBold24.copyWith(
                    color: AppColors.black,
                  ),
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

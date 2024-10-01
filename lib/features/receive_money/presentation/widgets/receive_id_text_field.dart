import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/styles/colors.dart';
import '../../../../core/styles/texts_style.dart';
import '../../../../core/widgets/custom_snack_bar.dart';
import '../../../../generated/l10n.dart';

class ReceiveIdTextField extends StatelessWidget {
  const ReceiveIdTextField({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      height: 120,
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
                S.of(context).CopyID,
                style: TextsStyle.textStyleRegular12.copyWith(
                  color: AppColors.grey94,
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Text(
                S.of(context).Id,
                style: TextsStyle.textStyleSemiBold24.copyWith(
                  color: AppColors.grey94,
                ),
              ),
              const SizedBox(width: 16.0),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintStyle: TextsStyle.textStyleRegular15.copyWith(
                            color: AppColors.grey94,
                          ),
                          hintText: id,
                          counterStyle: TextsStyle.textStyleSemiBold24.copyWith(
                            color: AppColors.black,
                          ),
                          border: InputBorder.none,
                        ),
                        style: TextsStyle.textStyleSemiBold24.copyWith(
                          color: AppColors.black,
                        ),
                        enabled: false,
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    IconButton(
                      iconSize: 30,
                      style: const ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(
                          AppColors.white,
                        ),
                      ),
                      onPressed: () {
                        Clipboard.setData(ClipboardData(text: id));

                        buildShowSnackBar(
                            context, S.of(context).CopiedToClipboard);
                      },
                      icon: const Icon(
                        Icons.copy,
                        color: AppColors.blue,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

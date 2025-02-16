import 'package:flutter/material.dart';

import '../../../../core/local/local_settings.dart';
import '../../../../core/styles/colors.dart';
import '../../../../core/styles/texts_style.dart';
import '../../../../generated/l10n.dart';
import '../../../send_money_screen/presentation/scan_qr_sacn_screen.dart';

class PaymentIdTextField extends StatelessWidget {
  final TextEditingController textController;

  const PaymentIdTextField({super.key, required this.textController});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
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
                S.of(context).EnterPaymentID,
                style: TextsStyle.textStyleRegular12.copyWith(
                  color: AppColors.grey94,
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Text(
                S.of(context).ID,
                style: TextsStyle.textStyleSemiBold24.copyWith(
                  color: AppColors.grey94,
                ),
              ),
              const SizedBox(width: 16.0),
              Expanded(
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return S.of(context).EnterId;
                    }
                    return null;
                  },
                  controller: textController,
                  cursorColor: AppColors.blue,
                  decoration: InputDecoration(
                    hintStyle: TextsStyle.textStyleRegular12.copyWith(
                      color: AppColors.grey94,
                    ),
                    border: InputBorder.none,
                  ),
                  style: TextsStyle.textStyleSemiBold24,
                  keyboardType: TextInputType.number,
                ),
              ),
              IconButton(
                iconSize: 40,
                style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(
                    AppColors.transparent,
                  ),
                ),
                onPressed: () async {
                  // Navigate to QrScanScreen and wait for the result
                  final scannedId = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const QrScanScreen(),
                    ),
                  );

                  // If a scanned ID is returned, set it to the text controller
                  if (scannedId != null) {
                    textController.text = scannedId;
                  }
                },
                icon: const Icon(
                  Icons.qr_code,
                  color: AppColors.blue,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

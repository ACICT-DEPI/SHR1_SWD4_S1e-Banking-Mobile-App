import 'package:flutter/material.dart';
import 'package:bank_app/core/styles/colors.dart';
import 'package:bank_app/core/styles/texts_style.dart';

import '../scan_qr_sacn_screen.dart';

class SendIdTextField extends StatefulWidget {
  final TextEditingController textController;

  const SendIdTextField({super.key, required this.textController});

  @override
  State<SendIdTextField> createState() => _SendIdTextFieldState();
}

class _SendIdTextFieldState extends State<SendIdTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.lightGrey,
        ),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "Enter ID",
            style: TextsStyle.textStyleRegular12.copyWith(
              color: AppColors.grey94,
            ),
          ),
          const SizedBox(height: 16.0),
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
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter the id';
                    } else if (value.length < 25) {
                      return 'Please enter a valid id';
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
              IconButton(
                iconSize: 40,
                style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(
                    AppColors.white,
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
                    widget.textController.text = scannedId;
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

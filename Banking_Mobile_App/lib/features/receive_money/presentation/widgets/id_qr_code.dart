import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../../core/styles/colors.dart';

class IdQrCode extends StatelessWidget {
  const IdQrCode({
    super.key, required this.id,
  });
  final String id;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.lightGrey),
        borderRadius: BorderRadius.circular(16.0),
      ),
      padding: const EdgeInsets.all(12.0),
      margin: const EdgeInsets.all(30.0),
      child: QrImageView(
        data: id,
        dataModuleStyle: const QrDataModuleStyle(
          color: AppColors.blue,
          dataModuleShape: QrDataModuleShape.square,
        ),
        eyeStyle: const QrEyeStyle(
          color: AppColors.blue,
          eyeShape: QrEyeShape.square,
        ),
        version: QrVersions.auto,
      ),
    );
  }
}

import 'package:ai_barcode_scanner/ai_barcode_scanner.dart';
import 'package:flutter/material.dart';

import 'package:bank_app/core/styles/colors.dart';

// QR Scan Screen
class QrScanScreen extends StatefulWidget {
  const QrScanScreen({super.key});

  @override
  State<QrScanScreen> createState() => _QrScanScreenState();
}

class _QrScanScreenState extends State<QrScanScreen> {
  bool isFlashOn = false;

  // Initialize the controller once

  @override
  void initState() {
    super.initState();
  }

  PreferredSizeWidget appBarBuilder(
      BuildContext context, MobileScannerController controller) {
    return AppBar(
      leading: IconButton(
        style: const ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(AppColors.white),
        ),
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      backgroundColor: AppColors.white,
      title: const Text('QR Scanner'),
      actions: [
        IconButton(
          style: const ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(AppColors.white),
          ),
          icon: controller.torchEnabled
              ? const Icon(Icons.flashlight_off_rounded)
              : const Icon(Icons.flashlight_on_rounded),
          onPressed: controller.toggleTorch,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return AiBarcodeScanner(
      hideSheetTitle: true,
      appBarBuilder: (context, controller) =>
          appBarBuilder(context, controller),
      successColor: Colors.green,
      errorColor: Colors.red,
      onDispose: () {},
      hideGalleryButton: false,
      // Enable the gallery button
      onDetect: (BarcodeCapture capture) {
        // Get the scanned barcode value
        final String? scannedValue = capture.barcodes.first.rawValue;

        if (scannedValue != null) {
          // Return the scanned value and pop the screen
          Navigator.pop(context, scannedValue);
        } else {}
      },
      validator: (value) {
        if (value.barcodes.isEmpty) {
          return false;
        }
        if (!(value.barcodes.first.rawValue?.contains('flutter.dev') ??
            false)) {
          return false;
        }
        return true;
      },
    );
  }
}

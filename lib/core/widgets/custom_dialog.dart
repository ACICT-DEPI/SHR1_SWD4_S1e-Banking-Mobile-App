import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../local/local_settings.dart';
import '../styles/colors.dart';
import '../styles/texts_style.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({
    super.key,
    required this.dialogTitle,
    required this.dialogSubText,
    required this.onSubmit,
    required this.onCancel,
    required this.onSubmitText,
    required this.onCancelText,
  });

  final String dialogTitle; // Title of the dialog
  final String dialogSubText; // Subtext of the dialog
  final Function() onSubmit;
  final Function() onCancel;
  final String onSubmitText;
  final String onCancelText;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Container(
        width: 300,
        height: MediaQuery.of(context).size.height / 5,
        decoration: BoxDecoration(
          color: (LocalSettings.getSettings().themeMode == 'Light' ||
                  LocalSettings.getSettings().themeMode == 'فاتح')
              ? AppColors.white
              : AppColors.dark,
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: [
            BoxShadow(
              offset: const Offset(12, 26),
              blurRadius: 50,
              spreadRadius: 0,
              color: Colors.grey.withOpacity(.1),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // CircleAvatar(
            //   backgroundColor: AppColors.transparent,
            //   radius: 30,
            //   child: Lottie.asset(
            //     "assets/images/Animation - 1727731082231 (1).json",
            //   ),
            // ),
            // const SizedBox(
            //   height: 15,
            // ),
            dialogTitle.isEmpty
                ? Container()
                : Text(
                    dialogTitle, // Using the dialog title
                    style: TextsStyle.textStyleMedium18,
                  ),
            const SizedBox(height: 10.0),
            dialogSubText.isEmpty
                ? Container()
                : Text(
                    dialogSubText, // Using the dialog subtext
                    style: TextsStyle.textStyleMedium14.copyWith(
                      color: AppColors.grey94,
                    ),
                  ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SimpleBtn1(
                  text: onSubmitText,
                  onPressed: () {
                    onSubmit(); // Call the submit function
                    Navigator.of(context).pop(); // Close the dialog
                  },
                ),
                SimpleBtn1(
                  text: onCancelText,
                  onPressed: () {
                    onCancel(); // Call the cancel function
                    Navigator.of(context).pop(); // Close the dialog
                  },
                  invertedColors: true,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SimpleBtn1 extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final bool invertedColors;

  const SimpleBtn1({
    required this.text,
    required this.onPressed,
    this.invertedColors = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = AppColors.blue;
    Color accentColor = (LocalSettings.getSettings().themeMode == 'Light' ||
            LocalSettings.getSettings().themeMode == 'فاتح')
        ? AppColors.white
        : AppColors.dark;
    return ElevatedButton(
      style: ButtonStyle(
        elevation: WidgetStateProperty.all(0),
        alignment: Alignment.center,
        side: WidgetStateProperty.all(
          const BorderSide(width: 1, color: primaryColor),
        ),
        padding: WidgetStateProperty.all(
          const EdgeInsets.only(right: 25, left: 25, top: 0, bottom: 0),
        ),
        backgroundColor: WidgetStateProperty.all(
          invertedColors ? accentColor : primaryColor,
        ),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          color: invertedColors ? primaryColor : accentColor,
          fontSize: 16,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../styles/texts_style.dart';

class CustomAppButton extends StatelessWidget {
  const CustomAppButton({
    super.key,
    this.onPressed,
    required this.title,
  });

  final Function()? onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(

      onPressed: onPressed,
      style: ButtonStyle(

        fixedSize: WidgetStatePropertyAll(
          Size(MediaQuery.sizeOf(context).width, 56),
        ),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
      child: Text(
        title,
        style: TextsStyle.textStyleSemiBold16,
      ),
    );
  }
}

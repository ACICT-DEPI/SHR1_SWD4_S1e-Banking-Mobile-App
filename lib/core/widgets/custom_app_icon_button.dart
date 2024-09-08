import 'package:flutter/material.dart';

class CustomAppIconButton extends StatelessWidget {
  const CustomAppIconButton({
    super.key,
    this.onPressed,
    required this.icon,
  });

  final Function()? onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(
        icon,
        size: 22,
      ),
      style: ButtonStyle(
        fixedSize: const WidgetStatePropertyAll(Size(48, 48)),
        shape: WidgetStatePropertyAll(
          ContinuousRectangleBorder(
            borderRadius: BorderRadius.circular(double.infinity),
          ),
        ),
      ),
    );
  }
}

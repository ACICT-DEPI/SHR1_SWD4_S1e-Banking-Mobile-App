import 'package:bank_app/core/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CardInputField extends StatelessWidget {
  final String label;
  final IconData icon;
  final TextEditingController controller;
  final bool showCardIcons;
  final Function(String) onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType keyboardType;

  const CardInputField({
    super.key,
    required this.label,
    required this.icon,
    required this.controller,
    this.showCardIcons = false,
    required this.onChanged,
    this.inputFormatters,
    required this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(color: AppColors.greyA7, fontSize: 14),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Icon(
              icon,
              color: AppColors.greyA7,
              size: 22,
            ),
            const SizedBox(width: 16.0),
            Expanded(
              child: TextFormField(
                controller: controller,
                onChanged: onChanged,
                keyboardType: keyboardType,
                inputFormatters: inputFormatters,
                cursorColor: AppColors.blue,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.zero,
                ),
                style: const TextStyle(
                  fontSize: 14,
                  color: AppColors.black,
                ),
              ),
            ),
            if (showCardIcons)
              SvgPicture.asset(
                "assets/images/master_card.svg",
                height: 22,
              ),
          ],
        ),
        const Divider(
          color: AppColors.greyF4,
          height: 1,
        ),
      ],
    );
  }
}

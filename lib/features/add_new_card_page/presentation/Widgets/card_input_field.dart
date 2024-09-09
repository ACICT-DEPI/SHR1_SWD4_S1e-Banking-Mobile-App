import 'package:bank_app/core/styles/colors.dart';
import 'package:flutter/cupertino.dart';
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
    required this.label,
    required this.icon,
    required this.controller,
    this.showCardIcons = false,
    required this.onChanged,
    this.inputFormatters,
    required this.keyboardType ,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(color: Colors.grey),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          decoration: BoxDecoration(
            // border: Border.all(color: Colors.grey),
            // borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Icon(icon, color: Colors.grey),
              const SizedBox(width: 10),
              Expanded(
                child: TextField(
                  keyboardType: keyboardType,
                  controller: controller,
                  cursorColor: AppColors.blue,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                  style: const TextStyle(fontSize: 16),
                  onChanged: onChanged,
                  inputFormatters: inputFormatters,
                ),
              ),
              if (showCardIcons)
                Row(
                  children: [
                    SvgPicture.asset("assets/images/master_card.svg")
                  ],
                ),
            ],
          ),
        ),
        Divider(color: Colors.grey.shade300),
      ],
    );
  }
}

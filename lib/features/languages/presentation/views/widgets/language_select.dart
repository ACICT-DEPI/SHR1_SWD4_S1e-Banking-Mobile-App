import 'package:bank_app/core/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:bank_app/core/styles/texts_style.dart';

class LanguageOption extends StatefulWidget {
  final String countryCode;
  final String language;
  final bool isSelected;
  final Function(bool?) onChanged;

  const LanguageOption({
    super.key,
    required this.countryCode,
    required this.language,
    required this.isSelected,
    required this.onChanged,
  });

  @override
  State<LanguageOption> createState() => _LanguageOptionState();
}

class _LanguageOptionState extends State<LanguageOption> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(0),
        border: const Border(
          top: BorderSide(color: AppColors.greyF4, width: 1),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const CircleAvatar(
            radius: 25,
            // child: SvgPicture.asset(
            //   widget.countryCode,

            // ),
          ),

          const SizedBox(width: 12), //
          Text(widget.language, style: TextsStyle.textStyleMedium16),
          const Spacer(flex: 4),
          Radio(
            value: true,
            groupValue: widget.isSelected, // Selection state
            onChanged: widget.onChanged, // Callback for changes
          ),
        ],
      ),
    );
  }
}

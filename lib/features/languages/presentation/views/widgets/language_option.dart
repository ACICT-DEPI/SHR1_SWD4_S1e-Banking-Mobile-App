import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/helpers/images.dart';
import '../../../../../core/styles/colors.dart';
import '../../../../../core/styles/texts_style.dart';
import '../../../data/models/language_model.dart';

class LanguageOption extends StatelessWidget {
  final LanguageModel languageModel;

  const LanguageOption({
    super.key,
    required this.languageModel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                radius: 28,
                child: SvgPicture.asset(
                  languageModel.languageImage,
                ),
              ),

              const SizedBox(width: 12), //
              Text(languageModel.languageName,
                  style: TextsStyle.textStyleMedium16),
              const Spacer(flex: 4),
              if (languageModel.isSelected)
                SvgPicture.asset(
                  Images.imagesCheckIcon,
                )
            ],
          ),
          const Divider(
            color: AppColors.greyF4,
          )
        ],
      ),
    );
  }
}

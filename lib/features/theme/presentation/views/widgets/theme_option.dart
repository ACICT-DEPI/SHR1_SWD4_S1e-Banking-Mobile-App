import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/helpers/images.dart';
import '../../../../../core/styles/colors.dart';
import '../../../../../core/styles/texts_style.dart';
import '../../../../settings/data/models/settings_model.dart';

class ThemeOption extends StatelessWidget {
  const ThemeOption({
    super.key,
    required this.themeMode,
    required this.settingsModel,
  });

  final String themeMode;

  final SettingsModel settingsModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // CircleAvatar(
              //   radius: 28,
              //   child: SvgPicture.asset(
              //     languageModel.languageImage,
              //   ),
              // ),

              const SizedBox(width: 12), //
              Text(themeMode,
                  style: TextsStyle.textStyleMedium16),
              const Spacer(flex: 4),
              if (themeMode == settingsModel.themeMode)
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

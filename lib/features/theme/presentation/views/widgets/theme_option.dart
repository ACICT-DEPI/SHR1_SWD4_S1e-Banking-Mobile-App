import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/helpers/images.dart';
import '../../../../../core/local/local_settings.dart';
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
              CircleAvatar(
                radius: 28,
                backgroundColor:
                    (LocalSettings.getSettings().themeMode == 'Light')
                        ? AppColors.greyF4
                        : AppColors.dark,
                child: Icon(
                  (themeMode == 'Light') ? Icons.sunny : FontAwesomeIcons.moon,
                  color: (LocalSettings.getSettings().themeMode == 'Light')
                      ? AppColors.dark
                      : AppColors.white,
                ),
              ),

              const SizedBox(width: 12), //
              Text(themeMode, style: TextsStyle.textStyleMedium16),
              const Spacer(flex: 4),
              if (themeMode == settingsModel.themeMode)
                SvgPicture.asset(
                  Images.imagesCheckIcon,
                )
            ],
          ),
          const SizedBox(height: 12.0),
          const Divider(height: 0)
        ],
      ),
    );
  }
}

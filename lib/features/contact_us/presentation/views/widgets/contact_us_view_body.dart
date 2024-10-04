import 'package:flutter/material.dart';

import '../../../../../core/local/local_settings.dart';
import '../../../../../core/styles/colors.dart';
import '../../../../../core/styles/texts_style.dart';
import '../../../../../core/widgets/custom_app_bar.dart';
import '../../../../../generated/l10n.dart';

class ContactUsViewBody extends StatelessWidget {
  const ContactUsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isLightTheme =
        LocalSettings.getSettings().themeMode == 'Light' ||
            LocalSettings.getSettings().themeMode == 'فاتح';

    final Color textColor = isLightTheme ? AppColors.grey533 : AppColors.white;
    final Color cardBackgroundColor =
        isLightTheme ? AppColors.white : AppColors.dark;

    return Padding(
      padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
      child: Column(
        children: [
          CustomAppBar(
            appBarTitle: S.of(context).ContactUs,
            onPressedLeft: () {
              Navigator.pop(context);
            },
            leftIcon: Icons.arrow_back_ios_new_outlined,
          ),
          const SizedBox(height: 20),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _buildContactCard(
                    title: S.of(context).CustomerSupport,
                    content: S.of(context).CustomerSupportDescription,
                    textColor: textColor,
                    cardBackgroundColor: cardBackgroundColor,
                  ),
                  const SizedBox(height: 20),
                  _buildContactCard(
                    title: S.of(context).OfficeAddress,
                    content: S.of(context).OfficeAddressDescription,
                    textColor: textColor,
                    cardBackgroundColor: cardBackgroundColor,
                  ),
                  const SizedBox(height: 20),
                  _buildContactCard(
                    title: S.of(context).Feedback,
                    content: S.of(context).FeedbackDescription,
                    textColor: textColor,
                    cardBackgroundColor: cardBackgroundColor,
                  ),
                  const SizedBox(height: 20),
                  _buildContactCard(
                    title: S.of(context).SocialMedia,
                    content: S.of(context).SocialMediaDescription,
                    textColor: textColor,
                    cardBackgroundColor: cardBackgroundColor,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactCard({
    required String title,
    required String content,
    required Color textColor,
    required Color cardBackgroundColor,
  }) {
    return Card(
      color: cardBackgroundColor,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextsStyle.textStyleMedium14.copyWith(
                color: textColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              content,
              style: TextsStyle.textStyleMedium14.copyWith(
                color: textColor,
              ),
            ),
            const SizedBox(height: 8.0),
            const Divider(thickness: 1),
          ],
        ),
      ),
    );
  }
}

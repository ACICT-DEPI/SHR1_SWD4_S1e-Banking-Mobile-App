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
                    title: "1. Customer Support",
                    content:
                    "For any inquiries, issues, or support, feel free to reach out to our customer support team via email at support@bankapp.com or call us at +123 456 7890.",
                    textColor: textColor,
                    cardBackgroundColor: cardBackgroundColor,
                  ),
                  const SizedBox(height: 20),
                  _buildContactCard(
                    title: "2. Office Address",
                    content:
                    "Our main office is located at 123 Bank Street, Suite 456, Financial City, Country. Visit us during our business hours from 9 AM to 5 PM, Monday to Friday.",
                    textColor: textColor,
                    cardBackgroundColor: cardBackgroundColor,
                  ),
                  const SizedBox(height: 20),
                  _buildContactCard(
                    title: "3. Feedback",
                    content:
                    "We value your feedback to help improve our services. Please send your comments or suggestions to feedback@bankapp.com.",
                    textColor: textColor,
                    cardBackgroundColor: cardBackgroundColor,
                  ),
                  const SizedBox(height: 20),
                  _buildContactCard(
                    title: "4. Social Media",
                    content:
                    "Connect with us on social media for updates and announcements: Twitter @BankApp, Facebook @BankAppOfficial, Instagram @BankApp.",
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

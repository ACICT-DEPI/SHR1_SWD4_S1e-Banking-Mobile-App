import 'package:flutter/material.dart';

import '../../../../../core/local/local_settings.dart';
import '../../../../../core/styles/colors.dart';
import '../../../../../core/styles/texts_style.dart';
import '../../../../../core/widgets/custom_app_bar.dart';
import '../../../../../generated/l10n.dart';

class PrivacyPolicyViewBody extends StatelessWidget {
  const PrivacyPolicyViewBody({super.key});

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
            appBarTitle: S.of(context).PrivacyPolicy,
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
                  _buildPrivacyCard(
                    title: "1. Introduction",
                    content:
                        "Welcome to our Banking App. We value your privacy and are committed to protecting your personal information. This Privacy Policy outlines how we collect, use, and protect your data when you use our app.",
                    textColor: textColor,
                    cardBackgroundColor: cardBackgroundColor,
                  ),
                  const SizedBox(height: 20),
                  _buildPrivacyCard(
                    title: "2. Information We Collect",
                    content:
                        "We collect personal information such as your name, email address, phone number, and payment details to provide banking services. We may also collect device information and app usage data for security and performance optimization.",
                    textColor: textColor,
                    cardBackgroundColor: cardBackgroundColor,
                  ),
                  const SizedBox(height: 20),
                  _buildPrivacyCard(
                    title: "3. How We Use Your Information",
                    content:
                        "Your information is used to facilitate banking transactions, provide customer support, and improve our services. We do not share your information with third parties unless required by law.",
                    textColor: textColor,
                    cardBackgroundColor: cardBackgroundColor,
                  ),
                  const SizedBox(height: 20),
                  _buildPrivacyCard(
                    title: "4. Data Security",
                    content:
                        "We implement strict security measures to protect your personal information from unauthorized access, disclosure, or loss.",
                    textColor: textColor,
                    cardBackgroundColor: cardBackgroundColor,
                  ),
                  const SizedBox(height: 20),
                  _buildPrivacyCard(
                    title: "5. Your Consent",
                    content:
                        "By using our app, you consent to the terms of this Privacy Policy. If you do not agree with our practices, please do not use the app.",
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

  Widget _buildPrivacyCard({
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

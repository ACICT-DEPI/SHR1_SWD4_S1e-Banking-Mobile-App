import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_app_bar.dart';
import '../../../../change_password/presentation/views/change_password.dart';
import '../../../../languages/presentation/views/languages_view.dart';
import '../../../../privacy_policy/presentation/views/privacy_policy.dart';
import '../../../../profile/presentation/views/profile_view.dart';
import 'biometric_switch_button.dart';
import 'main_section_title.dart';
import 'settings_button.dart';

class SettingsViewBody extends StatefulWidget {
  const SettingsViewBody({super.key});

  @override
  State<SettingsViewBody> createState() => _SettingsViewBodyState();
}

class _SettingsViewBodyState extends State<SettingsViewBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomAppBar(appBarTitle: "Settings"),
            const SizedBox(height: 38),
            const MainSectionTitle(text: "General"),
            const SizedBox(height: 20.0),
            SettingsButton(
              text: "Language",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LanguagesView(),
                  ),
                );
              },
              label: "English",
            ),
            const SizedBox(height: 28.0),
            SettingsButton(
              text: "My Profile",
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProfileView(),
                    ));
              },
            ),
            const SizedBox(height: 28.0),
            SettingsButton(
              text: "Contact Us",
              onPressed: () {},
            ),
            const SizedBox(height: 32),
            const MainSectionTitle(text: "Security"),
            const SizedBox(height: 20.0),
            SettingsButton(
              text: "Change Password",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ChangePassword(),
                  ),
                );
              },
            ),
            const SizedBox(height: 28.0),
            SettingsButton(
              text: "Privacy Policy",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PrivacyPolicy(),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            const MainSectionTitle(text: "Choose what data you share with us"),
            const SizedBox(height: 16.0),
            const BiometricSwitchButton(),
          ],
        ),
      ),
    );
  }
}

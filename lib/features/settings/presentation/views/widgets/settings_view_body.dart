import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/Routing/Routing.dart';
import '../../../../../core/widgets/custom_app_bar.dart';
import '../../../../all_cards_screen/presentation/views/all_cards_screen.dart';
import '../../../../languages/presentation/views/languages_view.dart';
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
            const SizedBox(height: 24.0),
            SettingsButton(
              text: "My Profile",
              onPressed: () {
                GoRouter.of(context).push(
                  Routing.profileView,
                );
              },
            ),
            const SizedBox(height: 24.0),
            SettingsButton(
              text: "All Cards",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AllCardsScreen(),
                  ),
                );
              },
            ),
            const SizedBox(height: 32),
            const MainSectionTitle(text: "Security"),
            const SizedBox(height: 20.0),
            SettingsButton(
              text: "Privacy Policy",
              onPressed: () {
                GoRouter.of(context).push(Routing.privacyPolicy);
              },
            ),
            const SizedBox(height: 24.0),
            SettingsButton(
              text: "Contact Us",
              onPressed: () {},
            ),
            const SizedBox(height: 20),
            const MainSectionTitle(text: "Choose what data you share with us"),
            const SizedBox(height: 8.0),
            const BiometricSwitchButton(),
          ],
        ),
      ),
    );
  }
}

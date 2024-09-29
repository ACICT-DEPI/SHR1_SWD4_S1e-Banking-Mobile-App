import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/Routing/Routing.dart';
import '../../../../../core/widgets/Loading_screen.dart';
import '../../../../../core/widgets/custom_app_bar.dart';
import '../../../data/models/settings_model.dart';
import '../../../domain/cubits/settings_cubit.dart';
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
    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, state) {
        if (state is SettingsSuccess) {
          SettingsModel settingsModel = state.settingsModel;
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
                      GoRouter.of(context).push(Routing.languagesView);
                    },
                    label: settingsModel.language,
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
                      GoRouter.of(context).push(Routing.allCardsScreen);
                    },
                  ),
                  const SizedBox(height: 24.0),
                  SettingsButton(
                    text: "Theme Mode",
                    onPressed: () {
                      ///
                      ///
                      ///
                    },
                    label: settingsModel.themeMode,
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
                  if (settingsModel.supportBiometric) ...[
                    const SizedBox(height: 20),
                    const MainSectionTitle(text: "Use fingerprint or PIN code"),
                    const SizedBox(height: 8.0),
                    BiometricSwitchButton(
                      onChanged: (value) {
                        settingsModel.useBiometric = value;
                        BlocProvider.of<SettingsCubit>(context)
                            .updateSettingsModel(settingsModel);
                      },
                      value: settingsModel.useBiometric,
                    ),
                  ]
                ],
              ),
            ),
          );
        } else {
          return const LoadingScreen();
        }
      },
    );
  }
}

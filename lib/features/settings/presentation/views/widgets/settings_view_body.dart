import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/Routing/Routing.dart';
import '../../../../../core/local/local_settings.dart';
import '../../../../../core/widgets/Loading_screen.dart';
import '../../../../../core/widgets/custom_app_bar.dart';
import '../../../../../generated/l10n.dart';
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
                  CustomAppBar(appBarTitle: S.of(context).Settings),
                  const SizedBox(height: 38),
                  MainSectionTitle(text: S.of(context).General),
                  const SizedBox(height: 20.0),
                  SettingsButton(
                    text: S.of(context).Language,
                    onPressed: () {
                      GoRouter.of(context).push(Routing.languagesView);
                    },
                    label: settingsModel.language,
                  ),
                  const SizedBox(height: 24.0),
                  SettingsButton(
                    text: S.of(context).MyProfile,
                    onPressed: () {
                      GoRouter.of(context).push(
                        Routing.profileView,
                      );
                    },
                  ),
                  const SizedBox(height: 24.0),
                  SettingsButton(
                    text: S.of(context).AllCards,
                    onPressed: () {
                      GoRouter.of(context).push(Routing.allCardsScreen);
                    },
                  ),
                  const SizedBox(height: 24.0),
                  SettingsButton(
                    text: S.of(context).ThemeMode,
                    onPressed: () {
                      GoRouter.of(context).push(Routing.themeView);
                    },
                    label: (LocalSettings.getSettings().themeMode == "Light" ||
                            LocalSettings.getSettings().themeMode == "فاتح")
                        ? S.of(context).Light
                        : S.of(context).Dark,
                  ),
                  const SizedBox(height: 32),
                  MainSectionTitle(text: S.of(context).Security),
                  const SizedBox(height: 20.0),
                  SettingsButton(
                    text: S.of(context).PrivacyPolicy,
                    onPressed: () {
                      GoRouter.of(context).push(Routing.privacyPolicy);
                    },
                  ),
                  const SizedBox(height: 24.0),
                  SettingsButton(
                    text: S.of(context).ContactUs,
                    onPressed: () {
                      GoRouter.of(context).push(Routing.contactUsView);
                    },
                  ),
                  if (settingsModel.supportBiometric) ...[
                    const SizedBox(height: 32),
                    MainSectionTitle(text: S.of(context).UseFingerprintPIN),
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

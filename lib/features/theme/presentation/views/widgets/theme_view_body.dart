import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/helpers/constants.dart';
import '../../../../../core/widgets/Loading_screen.dart';
import '../../../../../core/widgets/custom_app_bar.dart';
import '../../../../settings/data/models/settings_model.dart';
import '../../../../settings/domain/cubits/settings_cubit.dart';
import '../../../domain/cubits/theme_cubit/theme_cubit.dart';
import 'theme_option.dart';

class ThemeViewBody extends StatefulWidget {
  const ThemeViewBody({super.key});

  @override
  State<ThemeViewBody> createState() => _ThemeViewBodyState();
}

class _ThemeViewBodyState extends State<ThemeViewBody> {
  bool changeTheme = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SettingsCubit, SettingsState>(
      listener: (context, state) {
        if (state is SettingsSuccess && changeTheme) {
          BlocProvider.of<ThemeCubit>(context).updateTheme();
          GoRouter.of(context).pop();
        }
      },
      builder: (context, state) {
        if (state is SettingsSuccess) {
          SettingsModel settingsModel = state.settingsModel;
          return Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
            child: Column(
              children: [
                CustomAppBar(
                  appBarTitle: "Theme Mode",
                  leftIcon: Icons.arrow_back_ios_new_outlined,
                  onPressedLeft: () {
                    Navigator.pop(context);
                  },
                  rightIcon: changeTheme ? Icons.done : null,
                  onPressedRight: changeTheme
                      ? () {
                          BlocProvider.of<SettingsCubit>(context)
                              .updateSettingsModel(settingsModel);
                        }
                      : null,
                ),
                const SizedBox(height: 32.0),
                Expanded(
                  child: ListView.builder(
                    itemCount: Constants.themes.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            changeTheme = true;
                          });
                          settingsModel.themeMode = Constants.themes[index];
                        },
                        child: ThemeOption(
                          themeMode: Constants.themes[index],
                          settingsModel: settingsModel,
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          );
        } else {
          return const LoadingScreen();
        }
      },
    );
  }
}

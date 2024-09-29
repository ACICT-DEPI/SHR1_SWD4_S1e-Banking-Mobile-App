import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/Routing/Routing.dart';
import '../../../../../core/network/firebase_authentication.dart';
import '../../../../../core/widgets/Loading_screen.dart';
import '../../../../../core/widgets/custom_app_bar.dart';
import '../../../../../core/widgets/error_screen.dart';
import '../../../../authentication/data/models/user_model.dart';
import '../../../../navigation_screen/logic/home_screen_cubit.dart';
import 'profile_information.dart';
import 'profile_row.dart';

class ProfileViewBody extends StatefulWidget {
  const ProfileViewBody({super.key});

  @override
  State<ProfileViewBody> createState() => _ProfileViewBodyState();
}

class _ProfileViewBodyState extends State<ProfileViewBody> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenCubit, HomeScreenState>(
      builder: (context, snap) {
        if (snap is HomeScreenSuccess) {
          UserModel userModel = snap.homeModel.userModel;
          return Padding(
            padding: const EdgeInsets.only(right: 20.0, top: 20.0, left: 20.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CustomAppBar(
                    appBarTitle: "Profile",
                    leftIcon: Icons.arrow_back_ios_new_outlined,
                    onPressedLeft: () {
                      Navigator.pop(context);
                    },
                  ),
                  const SizedBox(height: 32),
                  ProfileInformation(
                    id: userModel.userId!,
                    profileImage: userModel.image!,
                    profileName: userModel.fullName,
                  ),
                  const SizedBox(height: 52),
                  ProfileRow(
                    text: "Edit Profile",
                    icon: Icons.account_circle_outlined,
                    onPressed: () {
                      GoRouter.of(context).push(
                        Routing.editProfileScreen,
                      );
                    },
                  ),
                  const SizedBox(height: 28),
                  ProfileRow(
                    text: "Change Password",
                    icon: Icons.lock,
                    onPressed: () {
                      GoRouter.of(context).push(Routing.changePassword);
                    },
                  ),
                  const SizedBox(height: 28),
                  ProfileRow(
                    text: "Logout",
                    icon: Icons.exit_to_app,
                    onPressed: () async {
                      await FirebaseAuthentication.logoutUser();
                      while (GoRouter.of(context).canPop()) {
                        GoRouter.of(context).pop();
                      }
                      GoRouter.of(context).pushReplacement(
                        Routing.onboardingScreen,
                      );
                    },
                  ),
                  const SizedBox(height: 28),
                  ProfileRow(
                    text: "Delete Account",
                    icon: Icons.delete_forever_sharp,
                    onPressed: () async {
                      await FirebaseAuthentication.deleteUser();
                      while (GoRouter.of(context).canPop()) {
                        GoRouter.of(context).pop();
                      }
                      GoRouter.of(context).pushReplacement(
                        Routing.onboardingScreen,
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        } else if (snap is HomeScreenError) {
          return ErrorScreen(message: snap.message);
        } else {
          return const LoadingScreen();
        }
      },
    );
  }
}

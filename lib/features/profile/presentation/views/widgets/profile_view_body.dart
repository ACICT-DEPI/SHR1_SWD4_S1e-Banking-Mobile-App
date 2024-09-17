import 'package:bank_app/core/Routing/routing.dart';
import 'package:bank_app/features/all_cards_screen/presentation/views/all_cards_screen.dart';
import 'package:bank_app/features/category_chart/presentation/views/category_chart_view.dart';
import 'package:bank_app/features/privacy_policy/presentation/views/privacy_policy.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/helpers/images.dart';
import '../../../../../core/widgets/custom_app_bar.dart';
import '../../../../authentication/data/models/user_model.dart';
import 'profile_information.dart';
import 'profile_row.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key, required this.user});

  final UserModel user;

  @override
  Widget build(BuildContext context) {
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
              profileBalance: 45243.25,
              profileImage: Images.imagesPerson,
              profileName: user.fullName,
            ),
            const SizedBox(height: 52),
            ProfileRow(
              text: "Edit Profile",
              icon: Icons.account_circle_outlined,
              onPressed: () {
                GoRouter.of(context).push(
                  Routing.editProfileScreen,
                  extra: user,
                );
              },
            ),
            const SizedBox(height: 28),
            ProfileRow(
              text: "All Cards",
              icon: Icons.credit_card_sharp,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AllCardsScreen(),
                  ),
                );
              },
            ),
            const SizedBox(height: 28),
            ProfileRow(
              text: "Category Chart",
              icon: Icons.bar_chart,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CategoryChart(),
                  ),
                );
              },
            ),
            const SizedBox(height: 28),
            ProfileRow(
              text: "Contact Us",
              icon: Icons.phone,
              onPressed: () {},
            ),
            const SizedBox(height: 28),
            ProfileRow(
              text: "Privacy Policy ",
              icon: Icons.privacy_tip,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PrivacyPolicy(),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

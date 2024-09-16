import 'package:bank_app/core/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

import '../../../../../core/helpers/images.dart';
import '../edit_profile.dart';
import 'profile_information.dart';
import 'profile_row.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

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
            const ProfileInformation(
              profileBalance: 45243.25,
              profileImage: Images.imagesPerson,
              profileName: "Mohamed Gehad",
            ),
            const SizedBox(height: 32),
            ProfileRow(
              text: "Edit Profile",
              icon: Icons.account_circle_outlined,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const EditProfileScreen(),
                  ),
                );
              },
            ),
            const SizedBox(height: 28),
            ProfileRow(
              text: "All Cards",
              icon: Icons.credit_card_sharp,
              onPressed: () {},
            ),
            const SizedBox(height: 28),
            ProfileRow(
              text: "Category Chart",
              icon: Icons.bar_chart,
              onPressed: () {},
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
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../../core/styles/colors.dart';
import '../../../../core/styles/texts_style.dart';
import '../../../settings/presentation/views/settings.dart';
import 'edit_profile.dart';
import 'widgets/myrow3.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: 10,
            height: 10,
            child: CircleAvatar(
              backgroundColor: AppColors.greyF4,
              radius: 20,
              child: IconButton(
                icon: const Icon(Icons.arrow_back_ios_sharp),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Setting(),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
        title: const Text("Setting", style: TextsStyle.textStyleMedium18),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Padding(
              padding: EdgeInsets.all(8.0),
              child: SizedBox(
                height: 10,
                width: 10,
                child: CircleAvatar(
                    backgroundColor: AppColors.greyF4,
                    radius: 20,
                    child: Center(child: Icon(Icons.person_2_outlined))),
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 35,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      const Text(
                        "Tanya Myroniuk",
                        style: TextsStyle.textStyleMedium17,
                      ),
                      Text(
                        "Senior Designer",
                        style: TextsStyle.textStyleRegular12.copyWith(
                          color: AppColors.grey8D,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          MyRow3(
            text: "Personal Information",
            icon: IconButton(
              icon: const Icon(Icons.account_circle_outlined,
                  color: AppColors.greyA7),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const EditProfileScreen(),
                    ));
              },
            ),
          ),
          MyRow3(
            text: "All Cards",
            icon: IconButton(
              icon: const Icon(
                Icons.credit_card_sharp,
                color: AppColors.greyA7,
              ),
              onPressed: () {},
            ),
          ),
          MyRow3(
            text: "Address",
            icon: IconButton(
              icon: const Icon(Icons.location_on_outlined,
                  color: AppColors.greyA7),
              onPressed: () {},
            ),
          ),
          MyRow3(
            text: "Contact Us",
            icon: IconButton(
              icon: const Icon(
                Icons.phone,
                color: AppColors.greyA7,
              ),
              onPressed: () {},
            ),
          ),
          MyRow3(
            text: "Privacy Policy ",
            icon: IconButton(
              icon: const Icon(
                Icons.location_on_outlined,
                color: AppColors.greyA7,
              ),
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}

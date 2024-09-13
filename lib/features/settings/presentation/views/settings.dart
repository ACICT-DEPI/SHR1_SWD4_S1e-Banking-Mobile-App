import 'package:flutter/material.dart';

import '../../../../core/styles/colors.dart';
import '../../../../core/styles/texts_style.dart';
import '../../../change_password/presentation/views/change_password.dart';
import '../../../languages/presentation/views/languges.dart';
import '../../../privacy_policy/presentation/views/privacy_policy.dart';
import '../../../profile/presentation/views/profile.dart';
import 'widgets/myrow.dart';
import 'widgets/myrow2.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    bool switch_value = false;
    return Scaffold(
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
                onPressed: () {},
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
                    child: Center(child: Icon(Icons.exit_to_app))),
              ),
            ),
          )
        ],
      ),
      body: Container(
        color: AppColors.white,
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            const MyRow2(
              text: "General",
            ),
            MyRow(
              text: "Language",
              icon: IconButton(
                icon: const Icon(Icons.keyboard_arrow_right,
                    color: AppColors.greyA7),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Languages(),
                      ));
                },
              ),
              label: "English",
            ),
            MyRow(
              text: "My Profile",
              icon: IconButton(
                icon: const Icon(Icons.keyboard_arrow_right,
                    color: AppColors.greyA7),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Profile(),
                      ));
                },
              ),
            ),
            MyRow(
              text: "Contact Us",
              icon: IconButton(
                icon: const Icon(Icons.keyboard_arrow_right,
                    color: AppColors.greyA7),
                onPressed: () {},
              ),
            ),
            const MyRow2(
              text: "Security",
            ),
            MyRow(
              text: "Change Password",
              icon: IconButton(
                icon: const Icon(Icons.keyboard_arrow_right,
                    color: AppColors.greyA7),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ChangePassword(),
                    ),
                  );
                },
              ),
            ),
            MyRow(
              text: "Privacy Policy",
              icon: IconButton(
                icon: const Icon(Icons.keyboard_arrow_right,
                    color: AppColors.greyA7),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PrivacyPolicy(),
                    ),
                  );
                },
              ),
            ),
            const MyRow2(
              text: "Choose what data you share with us",
            ),
            Container(
              padding: const EdgeInsets.all(12.0),
              margin: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(0),
                border: const Border(
                  top: BorderSide(color: AppColors.greyF4, width: 1),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Biometric",
                    style: TextsStyle.textStyleMedium14
                        .copyWith(color: AppColors.black),
                  ),
                  const Spacer(
                    flex: 4,
                  ),
                  Switch(
                    value: switch_value,
                    onChanged: (value) {
                      setState(() {
                        switch_value = value;
                      });
                    },
                    activeColor: AppColors.blue,
                    inactiveThumbColor: AppColors.grey433,
                    inactiveTrackColor: Colors.grey.shade300,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:bank_app/core/styles/colors.dart';
import 'package:bank_app/core/styles/texts_style.dart';
import 'package:bank_app/features/profile/presentation/views/widgets/myrow4.dart';
import 'package:bank_app/features/settings/presentation/views/settings.dart';
import 'package:flutter/material.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

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
                      ));
                },
              ),
            ),
          ),
        ),
        title: const Text(
          "Edit Profile",
          style: TextsStyle.textStyleMedium18,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 50,
            ),
            const SizedBox(height: 20),
            const Text(
              'Tanya Myroniuk',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            const MyRow4(
              hintText: "Full Name",
              icon: Icons.account_circle_outlined,
            ),
            const SizedBox(height: 20),
            const MyRow4(hintText: "Email Address", icon: Icons.email_outlined),
            const SizedBox(height: 20),
            const MyRow4(hintText: "Phone Number", icon: Icons.phone),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.topLeft,
              child: Text('Birth Date',
                  style: TextsStyle.textStyleMedium14
                      .copyWith(color: AppColors.greyA7)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                          color: AppColors.greyF4,
                          // لون الحواف الرأسية عند عدم تفعيل الحقل
                          width: 2.0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                          color: AppColors.blue,
                          // لون الحواف الرأسية عند تفعيل الحقل
                          width: 2.0,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                          color: AppColors.greyF4,
                          // لون الحواف الرأسية عند عدم تفعيل الحقل
                          width: 2.0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                          color: AppColors.blue,
                          width: 2.0,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                          color: AppColors.greyF4,
                          width: 2.0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                          color: AppColors.blue,
                          width: 2.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              'Joined at 28 Jan 2021',
              style: TextsStyle.textStyleMedium14.copyWith(
                color: AppColors.greyA7,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

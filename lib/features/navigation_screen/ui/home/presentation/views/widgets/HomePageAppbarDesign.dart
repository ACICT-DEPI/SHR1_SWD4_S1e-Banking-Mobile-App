import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../../../core/styles/colors.dart';
import '../../../../../../../core/styles/texts_style.dart';



class Homepageappbardesign extends StatelessWidget implements PreferredSizeWidget {
  const Homepageappbardesign({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Row(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundImage: AssetImage('assets/images/person.png'), // Replace with your image
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome back,",
                style: TextsStyle.textStyleRegular12.copyWith(color: AppColors.grey8D),
              ),
              Text(
                "Tanya Myroniuk",
                style: TextsStyle.textStyleMedium18.copyWith(color: AppColors.black),
              ),
            ],
          ),
        ],
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: IconButton(
            icon: Icon(Icons.search, color: AppColors.black,size: 30,),
            onPressed: () {},
          ),
        ),
      ],
    );
  }

  // Implementing the preferredSize property for the AppBar
  @override
  Size get preferredSize => const Size.fromHeight(70.0); // Adjust the height as needed
}

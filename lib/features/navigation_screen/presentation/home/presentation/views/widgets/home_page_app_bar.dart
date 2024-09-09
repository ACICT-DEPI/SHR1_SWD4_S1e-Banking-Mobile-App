import 'package:flutter/material.dart';
import '../../../../../../../core/styles/colors.dart';
import '../../../../../../../core/styles/texts_style.dart';

class HomePageAppBarDesign extends StatelessWidget {
  final String username;
  final String imagePath;
  final VoidCallback? onSearchPressed;

  const HomePageAppBarDesign({
    Key? key,
    required this.username,
    required this.imagePath,
    this.onSearchPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage(imagePath), // Use the parameter imagePath
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome back,",
                    style: TextsStyle.textStyleRegular12.copyWith(color: AppColors.grey8D),
                  ),
                  Text(
                    username, // Use the parameter username
                    style: TextsStyle.textStyleMedium18.copyWith(color: AppColors.black),
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: IconButton(
              icon: const Icon(Icons.search, color: AppColors.black, size: 30,),
              onPressed: onSearchPressed, // Use the onSearchPressed callback
            ),
          ),
        ],
      ),
    );
  }
}

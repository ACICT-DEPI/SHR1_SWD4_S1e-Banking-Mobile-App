import 'package:flutter/material.dart';
import '../../../../../../../core/styles/colors.dart';
import '../../../../../../../core/styles/texts_style.dart';

class HomePageAppBarDesign extends StatelessWidget {
  final String username;
  final String imagePath;
  final VoidCallback? onSearchPressed;

  const HomePageAppBarDesign({
    super.key,
    required this.username,
    required this.imagePath,
    this.onSearchPressed,
  });

  @override
  Widget build(BuildContext context) {
    final double widthFactor = MediaQuery.of(context).size.width / 411;
    final double heightFactor = MediaQuery.of(context).size.height / 890;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12 * heightFactor),
      // Adjusted vertical padding
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 25, // Adjusted radius for responsiveness
                backgroundImage:
                    AssetImage(imagePath), // Use the parameter imagePath
              ),
              SizedBox(width: 10 * widthFactor), // Adjusted horizontal spacing
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome back,",
                    style: TextsStyle.textStyleRegular12.copyWith(
                      color: AppColors.grey8D,
                    ),
                  ),
                  Text(
                    username, // Use the parameter username
                    style: TextsStyle.textStyleMedium18.copyWith(
                      color: AppColors.black,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16 * widthFactor),
            // Adjusted horizontal padding
            child: IconButton(
              icon: Icon(
                Icons.search,
                color: AppColors.black,
                size: 30 * heightFactor,
              ), // Adjusted icon size
              onPressed: onSearchPressed, // Use the onSearchPressed callback
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../../../core/styles/colors.dart';
import '../../../../../core/styles/texts_style.dart';
import '../../../../../generated/l10n.dart';

class ProfileInformation extends StatelessWidget {
  const ProfileInformation({
    super.key,
    required this.profileImage,
    required this.profileName,
    required this.id,
  });

  final String profileImage;
  final String profileName;
  final String id;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 35,
          backgroundImage: NetworkImage(profileImage),
        ),
        const SizedBox(width: 22.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              profileName,
              style: TextsStyle.textStyleMedium17,
            ),
            const SizedBox(height: 6.0),
            Text(
              S.of(context).Id + " $id\$",
              style: TextsStyle.textStyleRegular12.copyWith(
                color: AppColors.grey8D,
              ),
            )
          ],
        )
      ],
    );
  }
}

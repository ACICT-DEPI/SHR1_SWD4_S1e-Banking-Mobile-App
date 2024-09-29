import 'package:flutter/material.dart';

import '../../../../../core/helpers/constants.dart';
import '../../../../../core/styles/colors.dart';
import '../../../../../core/styles/texts_style.dart';
import '../../../../../core/widgets/custom_app_bar.dart';
import 'language_option.dart';

class LanguagesViewBody extends StatefulWidget {
  const LanguagesViewBody({super.key});

  @override
  State<LanguagesViewBody> createState() => _LanguagesViewBodyState();
}

class _LanguagesViewBodyState extends State<LanguagesViewBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
      child: Column(
        children: [
          CustomAppBar(
            appBarTitle: "Languages",
            leftIcon: Icons.arrow_back_ios_new_outlined,
            onPressedLeft: () {
              Navigator.pop(context);
            },
          ),
          const SizedBox(height: 32.0),
          Container(
            decoration: BoxDecoration(
              color: AppColors.greyF4,
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search Language",
                hintStyle: TextsStyle.textStyleRegular14.copyWith(
                  color: AppColors.greyA7,
                ),
                prefixIcon: const Icon(
                  Icons.search,
                  color: AppColors.greyA7,
                ),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.all(15),
              ),
            ),
          ),
          const SizedBox(height: 20.0),
          Expanded(
            child: ListView.builder(
              itemCount: Constants.languages.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    for (var language in Constants.languages) {
                      language.isSelected = false;
                    }
                    setState(() {
                      Constants.languages[index].isSelected = true;
                    });
                  },
                  child: LanguageOption(
                    languageModel: Constants.languages[index],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

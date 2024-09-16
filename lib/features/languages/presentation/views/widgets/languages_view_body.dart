import 'package:bank_app/core/helpers/images.dart';
import 'package:bank_app/core/styles/texts_style.dart';
import 'package:bank_app/features/languages/data/models/language_model.dart';
import 'package:bank_app/features/languages/presentation/views/widgets/language_option.dart';
import 'package:flutter/material.dart';

import '../../../../../core/styles/colors.dart';
import '../../../../../core/widgets/custom_app_bar.dart';

class LanguagesViewBody extends StatefulWidget {
  const LanguagesViewBody({super.key});

  @override
  State<LanguagesViewBody> createState() => _LanguagesViewBodyState();
}

class _LanguagesViewBodyState extends State<LanguagesViewBody> {
  List<LanguageModel> languages = [
    LanguageModel(
      languageImage: Images.imagesArabic,
      languageName: 'Arabic',
      isSelected: false,
    ),
    LanguageModel(
      languageImage: Images.imagesEnglish,
      languageName: 'English',
      isSelected: true,
    ),
  ];

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
              itemCount: languages.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    for (var language in languages) {
                      language.isSelected = false;
                    }
                    setState(() {
                      languages[index].isSelected = true;
                    });
                  },
                  child: LanguageOption(
                    languageModel: languages[index],
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

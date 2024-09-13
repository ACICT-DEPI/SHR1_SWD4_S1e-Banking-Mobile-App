import 'package:flutter/material.dart';

import '../../../../core/styles/colors.dart';
import '../../../../core/styles/texts_style.dart';
import '../../../settings/presentation/views/settings.dart';
import 'widgets/language_select.dart';

class Languages extends StatefulWidget {
  const Languages({super.key});

  @override
  State<Languages> createState() => _LanguagesState();
}

class _LanguagesState extends State<Languages> {
  @override
  Widget build(BuildContext context) {
    bool isSelected = false;
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
          "Language",
          style: TextsStyle.textStyleMedium18,
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.greyF4,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: "Search...",
                  prefixIcon: Icon(Icons.search),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(15),
                ),
              ),
            ),
          ),
          LanguageOption(
            countryCode: 'assets/images/english.svg',
            language: 'English',
            isSelected: isSelected,
            onChanged: (value) {},
          ),
          LanguageOption(
            countryCode: 'us',
            language: 'Australia',
            isSelected: isSelected,
            onChanged: (value) {},
          ),
          LanguageOption(
            countryCode: 'assets/images/spanish.svg',
            language: 'Spanish',
            isSelected: isSelected,
            onChanged: (value) {},
          ),
          LanguageOption(
            countryCode: 'assets/images/french.svg',
            language: 'Franch',
            isSelected: isSelected,
            onChanged: (value) {},
          ),
          LanguageOption(
            countryCode: 'us',
            language: 'Arminia',
            isSelected: isSelected,
            onChanged: (value) {},
          ),
          LanguageOption(
            countryCode: 'us',
            language: 'Vietnam',
            isSelected: isSelected,
            onChanged: (value) {},
          ),
        ],
      ),
    );
  }
}

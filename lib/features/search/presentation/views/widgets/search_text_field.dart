import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/styles/colors.dart';
import '../../../../../core/styles/texts_style.dart';

class SearchTextField extends StatefulWidget {
  const SearchTextField({
    super.key,
    this.onChanged,
    required this.searchController,
  });

  final Function(String)? onChanged;
  final TextEditingController searchController;

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.greyF4,
        borderRadius: BorderRadius.circular(10.0),
      ),
      height: 44,
      child: TextField(
        controller: widget.searchController,
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: const Icon(
            Icons.search,
            color: AppColors.greyA7,
          ),
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                widget.searchController.clear();
              });
            },
            icon: const Icon(
              FontAwesomeIcons.xmark,
              color: AppColors.greyA7,
            ),
          ),
          hintText: "Search...",
          hintStyle: TextsStyle.textStyleRegular14,
        ),
        onChanged: widget.onChanged,
        style: TextsStyle.textStyleRegular14.copyWith(
          color: AppColors.grey8D,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../../core/helpers/functions.dart';
import '../../../../core/styles/colors.dart';
import '../../../../core/styles/texts_style.dart';

class ServiceDragButtonList extends StatefulWidget {
  const ServiceDragButtonList(
      {super.key,
      required this.services,
      this.onChanged,
      required this.serviceIndex});

  final List<String> services;
  final Function(int?)? onChanged;
  final int serviceIndex;

  @override
  State<ServiceDragButtonList> createState() => _ServiceDragButtonListState();
}

class _ServiceDragButtonListState extends State<ServiceDragButtonList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      height: 120,
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.lightGrey,
        ),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "Select Service",
            style: TextsStyle.textStyleRegular12.copyWith(
              color: AppColors.grey94,
            ),
          ),
          DropdownButtonFormField<int>(
            iconSize: 0,
            decoration: _inputDecoration(),
            isExpanded: true,
            dropdownColor: AppColors.white,
            value: widget.serviceIndex,
            items: _serviceItems(),
            onChanged: widget.onChanged,
          ),
        ],
      ),
    );
  }

  List<DropdownMenuItem<int>> _serviceItems() {
    return List.generate(
      widget.services.length,
      (index) => DropdownMenuItem<int>(
        value: index,
        child: Row(
          children: [
            Text(
              widget.services[index],
              style: TextsStyle.textStyleMedium14,
            ),
            const Spacer(),
            Functions.getTransactionIcon(
              Functions.getTransactionType(widget.services[index]),
            ),
          ],
        ),
      ),
    );
  }

  InputDecoration _inputDecoration() {
    return const InputDecoration(
      contentPadding: EdgeInsets.symmetric(
        horizontal: 12.0,
        vertical: 8.0,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
        borderSide: BorderSide(
          color: AppColors.greyF4,
          width: 2.0,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
        borderSide: BorderSide(
          color: AppColors.blue,
          width: 2.0,
        ),
      ),
    );
  }
}

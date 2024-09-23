import 'package:flutter/material.dart';
import '../../../../../core/styles/colors.dart';
import '../../../../../core/styles/texts_style.dart';

class BirthDateSelector extends StatefulWidget {
  const BirthDateSelector({super.key, required this.enabled});

  final bool enabled;

  @override
  State<BirthDateSelector> createState() => _BirthDateSelectorState();
}

class _BirthDateSelectorState extends State<BirthDateSelector> {
  int day = DateTime.now().day;
  int month = DateTime.now().month;
  int year = DateTime.now().year;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Birth Date',
          style: TextsStyle.textStyleMedium14.copyWith(
            color: AppColors.greyA7,
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Year Dropdown
            Expanded(
              child: DropdownButtonFormField<int>(
                decoration: _inputDecoration(),
                dropdownColor: AppColors.white,
                value: year,
                items: _yearItems(),
                onChanged: widget.enabled
                    ? (int? newValue) {
                        setState(() {
                          year = newValue!;
                          _updateDaysInMonth();
                        });
                      }
                    : null,
              ),
            ),
            const SizedBox(width: 10),

            // Month Dropdown
            Expanded(
              child: DropdownButtonFormField<int>(
                decoration: _inputDecoration(),
                value: month,
                dropdownColor: AppColors.white,
                items: _monthItems(),
                onChanged: widget.enabled
                    ? (int? newValue) {
                        setState(() {
                          month = newValue!;
                          _updateDaysInMonth();
                        });
                      }
                    : null,
              ),
            ),
            const SizedBox(width: 10),

            // Day Dropdown
            Expanded(
              child: DropdownButtonFormField<int>(
                decoration: _inputDecoration(),
                value: day,
                dropdownColor: AppColors.white,
                items: _dayItems(),
                onChanged: widget.enabled
                    ? (int? newValue) {
                        setState(() {
                          day = newValue!;
                        });
                      }
                    : null,
              ),
            ),
          ],
        ),
      ],
    );
  }

  InputDecoration _inputDecoration() {
    return const InputDecoration(
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
    );
  }

  List<DropdownMenuItem<int>> _yearItems() {
    return List<int>.generate(100, (index) => DateTime.now().year - index)
        .map((int value) {
      return DropdownMenuItem<int>(
        value: value,
        child: Text(value.toString()),
      );
    }).toList();
  }

  List<DropdownMenuItem<int>> _monthItems() {
    return List<int>.generate(12, (index) => index + 1).map((int value) {
      return DropdownMenuItem<int>(
        value: value,
        child: Text(value.toString()),
      );
    }).toList();
  }

  List<DropdownMenuItem<int>> _dayItems() {
    return List<int>.generate(daysInMonth(year, month), (index) => index + 1)
        .map((int value) {
      return DropdownMenuItem<int>(
        value: value,
        child: Text(value.toString()),
      );
    }).toList();
  }

  void _updateDaysInMonth() {
    int maxDays = daysInMonth(year, month);
    if (day > maxDays) {
      setState(() {
        day = maxDays;
      });
    }
  }

  int daysInMonth(int year, int month) {
    var firstDayOfNextMonth =
        (month < 12) ? DateTime(year, month + 1, 1) : DateTime(year + 1, 1, 1);
    var lastDayOfMonth = firstDayOfNextMonth.subtract(const Duration(days: 1));
    return lastDayOfMonth.day;
  }
}

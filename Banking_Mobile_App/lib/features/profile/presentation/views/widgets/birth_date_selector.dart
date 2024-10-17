import 'package:flutter/material.dart';
import '../../../../../core/local/local_settings.dart';
import '../../../../../core/styles/colors.dart';
import '../../../../../core/styles/texts_style.dart';
import '../../../../../generated/l10n.dart';
import '../../../../authentication/data/models/user_model.dart';

class BirthDateSelector extends StatefulWidget {
  const BirthDateSelector({
    super.key,
    required this.userModel,
    required this.enabled,
  });

  final bool enabled;
  final UserModel userModel;

  @override
  State<BirthDateSelector> createState() => _BirthDateSelectorState();
}

class _BirthDateSelectorState extends State<BirthDateSelector> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).BirthDate,
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
                dropdownColor:
                    (LocalSettings.getSettings().themeMode == "Light" ||
                            LocalSettings.getSettings().themeMode == "فاتح")
                        ? AppColors.white
                        : AppColors.black,
                value: widget.userModel.birthYear,
                items: _yearItems(),
                onChanged: widget.enabled
                    ? (int? newValue) {
                        setState(() {
                          widget.userModel.birthYear = newValue!;
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
                value: widget.userModel.birthMonth,
                dropdownColor:
                    (LocalSettings.getSettings().themeMode == "Light" ||
                            LocalSettings.getSettings().themeMode == "فاتح")
                        ? AppColors.white
                        : AppColors.black,
                items: _monthItems(),
                onChanged: widget.enabled
                    ? (int? newValue) {
                        setState(() {
                          widget.userModel.birthMonth = newValue!;
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
                value: widget.userModel.birthDay,
                dropdownColor:
                    (LocalSettings.getSettings().themeMode == "Light" ||
                            LocalSettings.getSettings().themeMode == "فاتح")
                        ? AppColors.white
                        : AppColors.black,
                items: _dayItems(),
                onChanged: widget.enabled
                    ? (int? newValue) {
                        setState(() {
                          widget.userModel.birthDay = newValue!;
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
    return InputDecoration(
      enabledBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(
          color: (LocalSettings.getSettings().themeMode == "Light" ||
                  LocalSettings.getSettings().themeMode == "فاتح")
              ? AppColors.greyF4
              : AppColors.dark,
          width: 2.0,
        ),
      ),
      focusedBorder: const OutlineInputBorder(
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
    return List<int>.generate(
        daysInMonth(
          widget.userModel.birthYear!,
          widget.userModel.birthMonth!,
        ),
        (index) => index + 1).map((int value) {
      return DropdownMenuItem<int>(
        value: value,
        child: Text(value.toString()),
      );
    }).toList();
  }

  void _updateDaysInMonth() {
    int maxDays =
        daysInMonth(widget.userModel.birthYear!, widget.userModel.birthMonth!);
    if (widget.userModel.birthDay! > maxDays) {
      setState(() {
        widget.userModel.birthDay = maxDays;
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

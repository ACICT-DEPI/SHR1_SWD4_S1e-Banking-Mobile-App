import 'package:flutter/cupertino.dart';

import '../../../../generated/l10n.dart';

class CardValidator {
  final BuildContext context;

  CardValidator(this.context);

  String? validateCardNumber(String? e) {
    String? value = e?.replaceAll(" ", "");
    if (value == null || value.isEmpty) {
      return S.of(context).FieldRequired;
    }
    final regExp = RegExp(r'^\d{16}$');
    if (!regExp.hasMatch(value.replaceAll(" ", ""))) {
      return S.of(context).Must16Digits;
    }
    return null;
  }

  String? validateCvv(String? value) {
    {
      if (value == null || value.isEmpty) {
        return S.of(context).FieldRequired;
      }
      final regExp = RegExp(r'^\d{3}$');
      if (!regExp.hasMatch(value)) {
        return S.of(context).Must3Digits;
      }
      return null;
    }
  }

  String? validateExpiryDate(String? value) {
    {
      if (value == null || value.isEmpty) {
        return S.of(context).ExpirationDateRequired;
      }
      final dateRegExp = RegExp(r'^(0[1-9]|1[0-2])\/([0-9]{2})$');
      if (!dateRegExp.hasMatch(value)) {
        return S.of(context).DateFormat;
      }
      final parts = value.split('/');
      final month = int.tryParse(parts[0]);
      final year = int.tryParse(parts[1]);
      final now = DateTime.now();
      final currentYear = now.year % 100;
      final currentMonth = now.month;
      if (year! < currentYear ||
          (year == currentYear && month! < currentMonth)) {
        return S.of(context).dateInPast;
      }
      return null;
    }
  }

  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return S.of(context).NameRequired;
    }
    final nameRegExp = RegExp(r'^[a-zA-Z\s]+$');
    if (!nameRegExp.hasMatch(value)) {
      return S.of(context).NameMustContainLetters;
    }
    return null;
  }
}

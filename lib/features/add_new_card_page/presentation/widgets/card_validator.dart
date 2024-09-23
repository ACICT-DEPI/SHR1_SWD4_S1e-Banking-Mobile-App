class CardValidator {
  static String? validateCardNumber(String? e) {
    String? value = e?.replaceAll(" ", "");
    if (value == null || value.isEmpty) {
      return 'Field is required';
    }
    final regExp = RegExp(r'^\d{16}$');
    if (!regExp.hasMatch(value.replaceAll(" ", ""))) {
      return 'Must be 16 digits';
    }
    return null;
  }

  static String? validateCvv(String? value) {
    {
      if (value == null || value.isEmpty) {
        return 'Field is required';
      }
      final regExp = RegExp(r'^\d{3}$');
      if (!regExp.hasMatch(value)) {
        return 'Must be 3 digits';
      }
      return null;
    }
  }

  static String? validateExpiryDate(String? value) {
    {
      if (value == null || value.isEmpty) {
        return 'Expiration date is required';
      }
      final dateRegExp = RegExp(r'^(0[1-9]|1[0-2])\/([0-9]{2})$');
      if (!dateRegExp.hasMatch(value)) {
        return 'format is (MM/YY)';
      }
      final parts = value.split('/');
      final month = int.tryParse(parts[0]);
      final year = int.tryParse(parts[1]);
      final now = DateTime.now();
      final currentYear = now.year % 100;
      final currentMonth = now.month;
      if (year! < currentYear ||
          (year == currentYear && month! < currentMonth)) {
        return 'date is in the past';
      }
      return null;
    }
  }

  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Name is required';
    }
    final nameRegExp = RegExp(r'^[a-zA-Z\s]+$');
    if (!nameRegExp.hasMatch(value)) {
      return 'Name must contain only letters';
    }
    return null;
  }
}

import 'package:flutter/services.dart';

class DateInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    // Define the new text
    String newText = newValue.text;

    // Remove non-numeric characters
    newText = newText.replaceAll(RegExp(r'[^0-9]'), '');

    // Add a slash after the month part
    if (newText.length > 2) {
      newText = '${newText.substring(0, 2)}/${newText.substring(2)}';
    }

    // Limit the input to 5 characters (MM/YY)
    if (newText.length > 5) {
      newText = newText.substring(0, 5);
    }

    // Return the formatted text
    return newValue.copyWith(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}

import 'package:flutter/services.dart';

class CardNumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    // Define the new text
    String newText = newValue.text;

    // Remove non-numeric characters
    newText = newText.replaceAll(RegExp(r'[^0-9]'), '');

    // Add a space after every 4 digits
    StringBuffer buffer = StringBuffer();
    for (int i = 0; i < newText.length; i++) {
      if (i > 0 && i % 4 == 0) {
        buffer.write(' ');
      }
      buffer.write(newText[i]);
    }
    newText = buffer.toString();

    // Limit the length to 19 characters (16 digits + 3 spaces)
    if (newText.length > 19) {
      newText = newText.substring(0, 19);
    }

    // Return the formatted text
    return newValue.copyWith(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}

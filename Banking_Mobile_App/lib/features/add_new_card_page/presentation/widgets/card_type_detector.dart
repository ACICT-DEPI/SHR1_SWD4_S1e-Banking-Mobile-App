import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CardInfoWidget extends StatelessWidget {
  final String cardNumber;

  const CardInfoWidget({super.key, required this.cardNumber});

  String detectCardType(String cardNumber) {
    // Simple detection based on the starting digits
    if (cardNumber.startsWith('4')) {
      return 'visa';
    } else if (cardNumber.startsWith('51') ||
        cardNumber.startsWith("52") ||
        cardNumber.startsWith("53") ||
        cardNumber.startsWith("54") ||
        cardNumber.startsWith("55")) {
      return 'mastercard';
    } else if (cardNumber.startsWith('3')) {
      if (cardNumber[1] == '4' || cardNumber[1] == '7') {
        return 'americanExpress';
      } else {
        return 'jcb';
      }
    } else if (cardNumber.startsWith('6')) {
      return 'discover';
    } else if (cardNumber.startsWith('5078') ||
        cardNumber.startsWith('5081') && cardNumber.length == 16) {
      return 'masar'; // Add detection for Masar card
    } else {
      return 'unknown';
    }
  }

  @override
  Widget build(BuildContext context) {
    final cardType = detectCardType(cardNumber);
    String assetPath = 'assets/images/mastercard-svgrepo-com.svg';

    switch (cardType) {
      case 'visa':
        assetPath = 'assets/images/visa-svgrepo-com (1).svg';
        break;
      case 'mastercard':
        assetPath = 'assets/images/mastercard-svgrepo-com.svg';
        break;
      case 'americanExpress':
        assetPath = 'assets/images/americanexpress-svgrepo-com.svg';
        break;
      case 'discover':
        assetPath = 'assets/images/discover-svgrepo-com (1).svg';
        break;
      case 'jcb':
        assetPath = 'assets/images/jcb-svgrepo-com.svg';
        break;
      case 'masar':
        assetPath = 'assets/images/Meeza (1).svg';
        break;
      default:
        assetPath = 'assets/images/money-bill-svgrepo-com.svg';
        break;
    }

    return SvgPicture.asset(
      assetPath,
      height: 40,
      width: 40,
    );
  }
}

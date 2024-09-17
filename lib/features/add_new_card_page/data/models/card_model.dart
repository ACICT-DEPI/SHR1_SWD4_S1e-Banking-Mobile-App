import 'dart:math';

class CardModel {
  final String cardName;
  final String expiryDate;
  final int cvv;
  final String cardNumber;
  double cardBalance;

  CardModel({
    required this.cardName,
    required this.expiryDate,
    required this.cvv,
    required this.cardNumber,
    double? cardBalance,
  }) : cardBalance = cardBalance ?? (Random().nextInt(9999999)) / 100;

  factory CardModel.fromJson(json) {
    return CardModel(
      cardName: json["cardName"],
      expiryDate: json["expiryDate"],
      cvv: json["cvv"],
      cardNumber: json["cardNumber"],
      cardBalance: json["cardBalance"],
    );
  }

  static Map toJson({
    required String cardName,
    required String expiryDate,
    required int cvv,
    required String cardNumber,
    required double cardBalance,
  }) {
    return {
      "cardName": cardName,
      "expiryDate": expiryDate,
      "cvv": cvv,
      "cardNumber": cardNumber,
      "cardBalance": cardBalance,
    };
  }
}

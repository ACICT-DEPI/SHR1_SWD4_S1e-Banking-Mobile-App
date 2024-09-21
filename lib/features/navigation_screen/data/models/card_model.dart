import 'dart:math';

class CardModel {
  final String cardNumber;
  final String cardHolderName;
  final String expiryDate;
  final String cardType;
  final String cvv;
  double cardBalance;

  CardModel({
    required this.cardNumber,
    required this.cardHolderName,
    required this.expiryDate,
    required this.cardType,
    required this.cvv,
    double? cardBalance,
  }) : cardBalance = cardBalance ?? (Random().nextInt(9999999)) / 100;

  // Factory method to create a CardModel from a map
  factory CardModel.fromMap(Map<String, dynamic> map) {
    return CardModel(
        cardNumber: map['cardNumber'] as String,
        cardHolderName: map['cardHolderName'] as String,
        expiryDate: map['expiryDate'] as String,
        cardType: map['cardType'] as String,
        cvv: map['cvv'] as String,
        cardBalance: map['cardBalance'] as double);
  }

  // Method to convert CardModel to a map
  static Map<String, dynamic> toMap(CardModel cardModel) {
    return {
      'cardNumber': cardModel.cardNumber,
      'cardHolderName': cardModel.cardHolderName,
      'expiryDate': cardModel.expiryDate,
      'cardType': cardModel.cardType,
      'cvv': cardModel.cvv,
      'cardBalance': cardModel.cardBalance,
    };
  }
}

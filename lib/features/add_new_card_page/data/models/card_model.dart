class CardModel {
  final String cardName;
  final String expiryDate;
  final int cvv;
  final String cardNumber;

  CardModel(
      {required this.cardName,
      required this.expiryDate,
      required this.cvv,
      required this.cardNumber});

  factory CardModel.fromJson(json) {
    return CardModel(
      cardName: json["cardName"],
      expiryDate: json["expiryDate"],
      cvv: json["cvv"],
      cardNumber: json["cardNumber"],
    );
  }

  static Map toJson(
      {required String cardName,
      required String expiryDate,
      required int cvv,
      required String cardNumber}) {
    return {
      "cardName": cardName,
      "expiryDate": expiryDate,
      "cvv": cvv,
      "cardNumber": cardNumber,
    };
  }
}

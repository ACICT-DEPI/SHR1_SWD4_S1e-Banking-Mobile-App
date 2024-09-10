class CardModel {
  final String cardNumber;
  final String cardHolderName;
  final String expiryDate;
  final String cardType;
  final String cvv;

  CardModel({
    required this.cardNumber,
    required this.cardHolderName,
    required this.expiryDate,
    required this.cardType,
    required this.cvv,
  });

  // Factory method to create a CardModel from a map
  factory CardModel.fromMap(Map<String, dynamic> map) {
    return CardModel(
      cardNumber: map['cardNumber'] as String,
      cardHolderName: map['cardHolderName'] as String,
      expiryDate: map['expiryDate'] as String,
      cardType: map['cardType'] as String,
      cvv: map['cvv'] as String,
    );
  }

  // Method to convert CardModel to a map
  Map<String, dynamic> toMap() {
    return {
      'cardNumber': cardNumber,
      'cardHolderName': cardHolderName,
      'expiryDate': expiryDate,
      'cardType': cardType,
      'cvv': cvv,
    };
  }

  @override
  String toString() {
    return 'CardModel(cardNumber: $cardNumber, cardHolderName: $cardHolderName, expiryDate: $expiryDate, cardType: $cardType, cvv: $cvv)';
  }
}

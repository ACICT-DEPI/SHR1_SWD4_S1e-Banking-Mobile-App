// Data Model for Transaction Success
class SuccessModel {
  final double amount;
  final String currencyType;
  final String senderName;
  final String senderId;
  final String receiverName;
  final String receiverId;
  final String receiverPhone;
  final String referenceNumber;
  final String date;

  SuccessModel(
      {required this.currencyType,
        required this.amount,
        required this.senderName,
        required this.senderId,
        required this.receiverName,
        required this.receiverId,
        required this.receiverPhone,
        required this.referenceNumber,
        required this.date,
      });
}

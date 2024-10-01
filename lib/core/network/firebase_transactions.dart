import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import '../../features/transaction_history/data/models/transaction_item_model.dart';
import 'firebase_authentication.dart';
import 'firebase_notifications.dart';

class FirebaseTransactions {
  static final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  static final CollectionReference _userCollection =
      _fireStore.collection('users');

  static final String _userId = FirebaseAuthentication.getUserId();

  static final DocumentReference _userDocument = _userCollection.doc(_userId);

  static Future<void> addNewTransaction(
      TransactionItemModel transactionModel, String cardNumber,BuildContext context) async {
    await sendMoney(-transactionModel.amount, cardNumber);
    await _userDocument.collection('transactions').add(
          TransactionItemModel.toJson(
            transactionModel: transactionModel,
            context: context
          ),
        );
  }

  static Future<List<TransactionItemModel>> getAllTransactions() async {
    List<TransactionItemModel> allTransactions = [];

    final QuerySnapshot transactionCollection = await _userDocument
        .collection('transactions')
        .orderBy("createdAt")
        .get();

    for (var transactionDoc in transactionCollection.docs) {
      allTransactions.add(
        TransactionItemModel.fromJson(
            transactionDoc.data() as Map<String, dynamic>),
      );
    }

    return allTransactions.reversed.toList();
  }

  static void addTransaction(var transactionsCollection, double amount,BuildContext context) {
    transactionsCollection.add(
      TransactionItemModel.toJson(
        transactionModel: TransactionItemModel(
          type: TransactionType.moneyTransfer,
          amount: amount,
        ),
        context: context
      ),
    );
  }

  static Future<void> sendMoney(double amount, String cardNumber) async {
    // Query the 'cards' collection to find the document with the provided 'cardNumber'
    var querySnapshot = await _userDocument
        .collection('cards')
        .where('cardNumber', isEqualTo: cardNumber)
        .get();

    // Check if any document is found with the given card number
    if (querySnapshot.docs.isNotEmpty) {
      // Get a reference to the first document found
      var docRef = querySnapshot.docs.first.reference;

      // Get the current data from the document
      var docSnapshot = await docRef.get();

      // Retrieve the current balance, defaulting to 0.0 if not found
      double currentBalance = docSnapshot.data()?['cardBalance'] ?? 0.0;

      // Calculate the updated balance
      double updatedBalance = currentBalance - amount;

      // Update the document with the new balance
      await docRef.update({'cardBalance': updatedBalance});
    }
  }

  static Future<void> receiveMoney(
      String id, double amount, String sender,BuildContext context) async {
    // Query the user collection to find the document matching the provided 'uid'
    var userSnapshot = await _userCollection.where('uid', isEqualTo: id).get();

    if (userSnapshot.docs.isNotEmpty) {
      // Get the reference to the user document
      var userDocRef = userSnapshot.docs.first.reference;

      // Query the 'cards' collection within the user document
      var cardSnapshot = await userDocRef.collection('cards').get();

      // Check if any card document is found
      if (cardSnapshot.docs.isNotEmpty) {
        // Get the reference to the first card document found
        await _addAmountToCard(cardSnapshot, amount);
      }

      var transactionsCollection = userDocRef.collection('transactions');

      FirebaseTransactions.addTransaction(transactionsCollection, amount,context);

      var notificationsCollection = userDocRef.collection('notifications');

      FirebaseNotifications.addReceiveNotification(
        notificationsCollection: notificationsCollection,
        amount: amount,
        sender: sender,
      );
    }
  }

  static Future<void> _addAmountToCard(var cardSnapshot, double amount) async {
    // Get the reference to the first card document found
    var cardDocRef = cardSnapshot.docs.first.reference;

    // Get the current data from the card document
    var cardDocSnapshot = await cardDocRef.get();

    // Retrieve the current card balance, defaulting to 0.0 if not found
    double currentBalance = cardDocSnapshot.data()?['cardBalance'] ?? 0.0;

    // Calculate the updated card balance
    double updatedBalance = currentBalance + amount;

    // Update the document with the new balance
    await cardDocRef.update({'cardBalance': updatedBalance});
  }
}

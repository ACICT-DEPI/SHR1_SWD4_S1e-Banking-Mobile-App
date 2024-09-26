import 'package:bank_app/features/authentication/data/models/user_model.dart';
import 'package:bank_app/features/statistics/data/models/month_model.dart';
import 'package:bank_app/features/transaction_history/data/models/transaction_item_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../features/navigation_screen/data/models/card_model.dart';
import 'firebase_authentication.dart';

class FirebaseService {
  static final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
  static final CollectionReference _userCollection =
      _fireStore.collection('users');

  static final String _userId = FirebaseAuthentication.getUserId();
  static final DocumentReference _userDocument = _userCollection.doc(_userId);

  /// Add a new card to the user's 'cards' subcollection
  static Future<void> addNewCard(CardModel card) async {
    await _userDocument.collection('cards').add(CardModel.toMap(card));
  }

  /// Retrieve all cards from the user's 'cards' subcollection
  static Future<List<CardModel>> getAllCards() async {
    List<CardModel> allCards = [];

    // Get all documents in the 'cards' subcollection
    final QuerySnapshot cardsCollection =
        await _userDocument.collection('cards').get();

    // Loop through the documents and add them to the list
    for (var cardDoc in cardsCollection.docs) {
      allCards.add(CardModel.fromMap(cardDoc.data() as Map<String, dynamic>));
    }

    return allCards;
  }

  static Future<int> getNumberOfCards() async {
    List<CardModel> allCards = await getAllCards();

    return allCards.length;
  }

  static Future<void> addNewTransaction(
      TransactionItemModel transactionModel, String cardNumber) async {
    await sendMoney(-transactionModel.amount, cardNumber);
    await _userDocument.collection('transactions').add(
          TransactionItemModel.toJson(
            transactionModel: transactionModel,
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

  static Future<void> addNewMonth(MonthModel month) async {
    await _userDocument.collection('monthsBalance').add(
          MonthModel.toJson(month),
        );
  }

  static void addMonths(List<MonthModel> months) {
    for (var month in months) {
      addNewMonth(month);
    }
  }

  static Future<void> updateMonth(MonthModel month) async {
    // Assuming 'index' is a field in the document, you need to retrieve the correct document first
    var querySnapshot = await _userDocument
        .collection('monthsBalance')
        .where('index', isEqualTo: month.index)
        .get();

    // Update the document if it exists
    if (querySnapshot.docs.isNotEmpty) {
      // Assuming only one document matches the 'index'
      var docRef = querySnapshot.docs.first.reference;

      await docRef.set(MonthModel.toJson(month), SetOptions(
        merge: true,
      ),);
    }
  }

  /// Retrieve all cards from the user's 'cards' subCollection
  static Future<List<MonthModel>> getAllMonths() async {
    List<MonthModel> allMonths = [];

    // Get all documents in the 'cards' subCollection
    final QuerySnapshot cardsCollection =
        await _userDocument.collection("monthsBalance").orderBy("index").get();

    // Loop through the documents and add them to the list
    for (var cardDoc in cardsCollection.docs) {
      allMonths.add(
        MonthModel.fromJson(cardDoc.data() as Map<String, dynamic>),
      );
    }

    return allMonths;
  }

  static Future<List<UserModel>> getAllUsers() async {
    List<UserModel> allUsers = [];

    // Fetch all documents in the 'users' collection
    var querySnapshot = await _userCollection.get();

    // Loop through the documents and add them to the list
    for (var userDoc in querySnapshot.docs) {
      allUsers.add(
        UserModel.fromJson(userDoc.data()),
      );
    }

    return allUsers;
  }

  static Future<UserModel?> getUser(String userId) async {
    UserModel? userModel;

    // Fetch all documents in the 'users' collection
    var querySnapshot = await _userCollection.get();

    for (var userDoc in querySnapshot.docs) {
      UserModel user = UserModel.fromJson(userDoc.data());
      if (user.userId == userId) {
        userModel = user;
        break;
      }
    }

    return userModel;
  }

  static Future<void> updateUser({
    String? fullName,
    String? emailAddress,
    String? phoneNumber,
    String? password,
  }) async {
    UserModel defaultUser = await FirebaseAuthentication.getUserModel();

    UserModel updatedUser = UserModel(
      fullName: fullName ?? defaultUser.fullName,
      phoneNumber: phoneNumber ?? defaultUser.phoneNumber,
      emailAddress: emailAddress ?? defaultUser.emailAddress,
      password: password ?? defaultUser.password,
      joinedAt: defaultUser.joinedAt,
      userId: defaultUser.userId,
    );
    await _fireStore.collection('users').doc(defaultUser.userId).set(
          UserModel.toJson(updatedUser),
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

  static Future<void> receiveMoney(String id, double amount) async {
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
  }
}

import 'package:bank_app/features/statistics/data/models/month_model.dart';
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

      await docRef.set(MonthModel.toJson(month));
    }
  }

  /// Retrieve all cards from the user's 'cards' subcollection
  static Future<List<MonthModel>> getAllMonths() async {
    List<MonthModel> allMonths = [];

// Get all documents in the 'cards' subcollection
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
}

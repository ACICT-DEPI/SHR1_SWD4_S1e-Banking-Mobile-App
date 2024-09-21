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
    final QuerySnapshot cardsCollection = await _userDocument.collection('cards').get();

    // Loop through the documents and add them to the list
    for (var cardDoc in cardsCollection.docs) {
      allCards.add(CardModel.fromMap(cardDoc.data() as Map<String, dynamic>));
    }

    return allCards;
  }
}

import '../../../../core/network/firebase_cards.dart';
import '../../../navigation_screen/data/models/card_model.dart';

class GetCardsRepository {
  Future<List<CardModel>> getUserCards() async {
    return await FirebaseCards.getAllCards();
  }
}

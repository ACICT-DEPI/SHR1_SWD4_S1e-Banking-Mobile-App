import '../../../../core/network/firebase_cards.dart';
import '../../../navigation_screen/data/models/card_model.dart';

class AddCardRepo {
  addNewCard(CardModel cardModel) {
    FirebaseCards.addNewCard(cardModel);
  }
}

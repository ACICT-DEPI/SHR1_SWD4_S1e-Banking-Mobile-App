import '../../../../core/network/firebase_service.dart';
import '../../../navigation_screen/data/models/card_model.dart';

class AddCardRepo {
  addNewCard(CardModel cardModel) {
    FirebaseService.addNewCard(cardModel);
  }
}

import '../../../../core/network/firebase_service.dart';
import '../../../navigation_screen/data/models/card_model.dart';

class GetCardsRepository {
  Future<List<CardModel>> getUserCards() async {
    return await FirebaseService.getAllCards();
  }
}

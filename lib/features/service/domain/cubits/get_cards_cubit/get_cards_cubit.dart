import 'package:bloc/bloc.dart';

import '../../../data/repo/get_cards_repository.dart';
import 'get_cards_state.dart';

class GetCardsCubit extends Cubit<GetCardsState> {
  GetCardsCubit() : super(GetCardsInitialState());
  final GetCardsRepository _getCardsRepository = GetCardsRepository();

  void getAllCards() async {
    emit(GetCardsLoadingState());
    try {
      final cards = await _getCardsRepository.getUserCards();

      emit(
        GetCardsSuccessState(cards: cards),
      );
    } catch (e) {
      emit(
        GetCardsFailedState(errMessage: e.toString()),
      );
    }
  }
}

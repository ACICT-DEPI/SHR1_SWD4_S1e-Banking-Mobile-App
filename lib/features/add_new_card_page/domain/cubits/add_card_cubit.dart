import 'package:bloc/bloc.dart';

import '../../../navigation_screen/data/models/card_model.dart';
import '../../data/repos/add_card_repo.dart';
import 'add_card_state.dart';

class AddCardCubit extends Cubit<AddCardState> {
  final AddCardRepo _addCardRepo = AddCardRepo();

  AddCardCubit() : super(AddCardInitialState());

  addNewCard(CardModel cardModel) async {
    emit(AddCardLoadingState());
    try {
      await _addCardRepo.addNewCard(cardModel);
      emit(AddCardSuccessState());
    } catch (e) {
      // Handle any errors that occur during fetching
      emit(
        AddCardFailedState(message: e.toString()),
      );
    }
  }
}

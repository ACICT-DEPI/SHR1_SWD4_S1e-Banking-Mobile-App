import '../../../../navigation_screen/data/models/card_model.dart';

abstract class GetCardsState {}

class GetCardsInitialState extends GetCardsState {}

class GetCardsLoadingState extends GetCardsState {}

class GetCardsSuccessState extends GetCardsState {
  final List<CardModel> cards;

  GetCardsSuccessState({required this.cards});
}

class GetCardsFailedState extends GetCardsState {
  final String errMessage;

  GetCardsFailedState({required this.errMessage});
}

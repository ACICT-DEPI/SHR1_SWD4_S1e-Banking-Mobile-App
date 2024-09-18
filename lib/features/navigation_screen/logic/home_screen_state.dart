part of 'home_screen_cubit.dart';

@immutable
abstract class HomeScreenState {}

class HomeScreenInitial extends HomeScreenState {}
class HomeScreenLoaded extends HomeScreenState {

  UserModel userModel;
  List<TransactionItemModel> transactions;
  List<CardModel> cards;

  HomeScreenLoaded({
    required this.userModel,
    required this.transactions,
    required this.cards
  });


}
class HomeScreenError extends HomeScreenState {

  String message;

  HomeScreenError({required this.message});
}

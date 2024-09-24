import '../../../data/models/transaction_item_model.dart';

abstract class TransactionState {}

class TransactionInitialState extends TransactionState {}

class TransactionLoadingState extends TransactionState {}

class TransactionSuccessState extends TransactionState {
  final List<TransactionItemModel> transactionModels;

  TransactionSuccessState({required this.transactionModels});
}

class TransactionFailedState extends TransactionState {
  final String errMessage;

  TransactionFailedState({required this.errMessage});
}

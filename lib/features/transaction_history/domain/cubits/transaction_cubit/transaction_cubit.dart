import 'package:bloc/bloc.dart';

import '../../../data/models/transaction_item_model.dart';
import '../../../data/repos/transaction_repo.dart';
import 'transaction_state.dart';

class TransactionCubit extends Cubit<TransactionState> {
  TransactionCubit() : super(TransactionInitialState());
  final TransactionRepo _transactionRepo = TransactionRepo();

  getAllTransactions() async {
    emit(TransactionLoadingState());
    try {
      List<TransactionItemModel> transactionModels =
          await _transactionRepo.getAllTransaction();
      emit(TransactionSuccessState(transactionModels: transactionModels));
    } catch (e) {
      emit(TransactionFailedState(errMessage: e.toString()));
    }
  }
}

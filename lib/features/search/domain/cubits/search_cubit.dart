import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import '../../../transaction_history/data/models/transaction_item_model.dart';
import '../../data/repos/search_repo.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());
  final SearchRepo _searchRepo = SearchRepo();

  getTransactions(String title,BuildContext context) async {
    emit(SearchLoading());
    List<TransactionItemModel> transactions = [];
    try {
      transactions = await _searchRepo.searchTransaction(title,context);
      emit(SearchSuccess(transactions: transactions));
    } catch (e) {
      emit(SearchFailed(errMessage: e.toString()));
    }
  }
}

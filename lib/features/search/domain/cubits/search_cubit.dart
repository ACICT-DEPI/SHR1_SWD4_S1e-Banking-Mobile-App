import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../transaction_history/data/models/transaction_item_model.dart';
import '../../data/repos/search_repo.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());
  final SearchRepo _searchRepo = SearchRepo();

  getTransactions(String title) async {
    emit(SearchLoading());
    List<TransactionItemModel> transactions = [];
    try {
      transactions = await _searchRepo.searchTransaction(title);
      emit(SearchSuccess(transactions: transactions));
    } catch (e) {
      emit(SearchFailed(errMessage: e.toString()));
    }
  }
}

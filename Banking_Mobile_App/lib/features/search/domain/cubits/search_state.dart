part of 'search_cubit.dart';

@immutable
sealed class SearchState {}

final class SearchInitial extends SearchState {}

final class SearchLoading extends SearchState {}

final class SearchFailed extends SearchState {
  final String errMessage;

  SearchFailed({required this.errMessage});
}

final class SearchSuccess extends SearchState {
  final List<TransactionItemModel> transactions;

  SearchSuccess({required this.transactions});
}

abstract class AddCardState {}

class AddCardInitialState extends AddCardState {}

class AddCardLoadingState extends AddCardState {}

class AddCardSuccessState extends AddCardState {}

class AddCardFailedState extends AddCardState {
  final String message;

  AddCardFailedState({required this.message});
}

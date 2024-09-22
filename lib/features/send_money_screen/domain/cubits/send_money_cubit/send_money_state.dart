abstract class SendMoneyState {}

class SendMoneyInitialState extends SendMoneyState {}

class SendMoneyLoadingState extends SendMoneyState {}

class SendMoneySuccessState extends SendMoneyState {}

class SendMoneyFailedState extends SendMoneyState {
  final String message;

  SendMoneyFailedState({required this.message});
}

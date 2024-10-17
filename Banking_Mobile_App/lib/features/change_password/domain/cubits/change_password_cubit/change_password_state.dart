abstract class ChangePasswordState {}

class ChangePasswordInitialState extends ChangePasswordState {}

class ChangePasswordLoadingState extends ChangePasswordState {}

class ChangePasswordSuccessState extends ChangePasswordState {}

class ChangePasswordFailedState extends ChangePasswordState {
  final String errMessage;

  ChangePasswordFailedState({required this.errMessage});
}

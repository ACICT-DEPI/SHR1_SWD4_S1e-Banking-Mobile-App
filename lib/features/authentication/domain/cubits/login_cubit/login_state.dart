class LoginState {}

class LoginInitialState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginSuccessState extends LoginState {
  var user;

  LoginSuccessState({required this.user});
}

class LoginFailureState extends LoginState {
  final String errMessage;

  LoginFailureState({required this.errMessage});
}

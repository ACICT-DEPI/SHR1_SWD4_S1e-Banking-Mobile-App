class SignUpState {}

class SignUpInitialState extends SignUpState {}

class SignUpLoadingState extends SignUpState {}

class SignUpSuccessState extends SignUpState {

}

class SignUpFailureState extends SignUpState {
  final String errMessage;

  SignUpFailureState({required this.errMessage});
}

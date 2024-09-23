abstract class EditUserState {}

class EditUserInitialState extends EditUserState {}

class EditUserLoadingState extends EditUserState {}

class EditUserSuccessState extends EditUserState {}

class EditUserFailedState extends EditUserState {
  final String errMessage;

  EditUserFailedState({required this.errMessage});
}

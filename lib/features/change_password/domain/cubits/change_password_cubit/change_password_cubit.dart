import 'package:bloc/bloc.dart';

import '../../../data/repos/change_password_repo.dart';
import 'change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit() : super(ChangePasswordInitialState());
  final ChangePasswordRepo _changePasswordRepo = ChangePasswordRepo();

  updatePassword(String newPassword) async {
    emit(ChangePasswordLoadingState());
    try {
      await _changePasswordRepo.updatePassword(newPassword);
      emit(ChangePasswordSuccessState());
    } catch (e) {
      emit(ChangePasswordFailedState(errMessage: e.toString()));
    }
  }
}

import 'package:bloc/bloc.dart';

import '../../../data/repos/edit_user_repo.dart';
import 'edit_user_state.dart';

class EditUserCubit extends Cubit<EditUserState> {
  EditUserCubit() : super(EditUserInitialState());
  final EditUserRepo _editUserRepo = EditUserRepo();

  Future<void> updateUser({
    required String fullName,
    required String emailAddress,
    required String phoneNumber,
    required int birthDay,
    required int birthMonth,
    required int birthYear,
  }) async {
    emit(EditUserInitialState());
    try {
      await _editUserRepo.updateUser(
        fullName: fullName,
        emailAddress: emailAddress,
        phoneNumber: phoneNumber,
        birthDay: birthDay,
        birthMonth: birthMonth,
        birthYear: birthYear,
      );
      emit(EditUserSuccessState());
    } catch (e) {
      emit(EditUserFailedState(errMessage: e.toString()));
    }
  }
}

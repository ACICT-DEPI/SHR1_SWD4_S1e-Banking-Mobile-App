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
  }) async {
    emit(EditUserInitialState());
    try {
      await _editUserRepo.updateUser(
          fullName: fullName,
          emailAddress: emailAddress,
          phoneNumber: phoneNumber);
      emit(EditUserSuccessState());
    } catch (e) {
      emit(EditUserFailedState(errMessage: e.toString()));
    }
  }
}

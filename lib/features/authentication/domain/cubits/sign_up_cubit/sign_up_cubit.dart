import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitialState());

  Future<void> userRegister(
      {required String email, required String password}) async {
    emit(SignUpLoadingState());
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      emit(SignUpSuccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(SignUpFailureState(errMessage: 'The password is too weak.'));
      } else if (e.code == 'email-already-in-use') {
        emit(SignUpFailureState(
            errMessage: 'The email address is already in use.'));
      } else if (e.code == 'invalid-email') {
        emit(SignUpFailureState(
            errMessage: 'The email address is badly formatted.'));
      } else if (e.code == 'operation-not-allowed') {
        emit(SignUpFailureState(
            errMessage: 'Email/password accounts are not enabled.'));
      } else {
        emit(SignUpFailureState(errMessage: 'The email may be wrong'));
      }
    } catch (e) {
      emit(SignUpFailureState(errMessage: 'An unexpected error occurred.'));
    }
  }
}

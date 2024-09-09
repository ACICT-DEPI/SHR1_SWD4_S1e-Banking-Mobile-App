import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitialState());

  Future<void> userLogin(
      {required String email, required String password}) async {
    emit(LoginLoadingState());
    try {
      var user = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      emit(LoginSuccessState(user: user));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(LoginFailureState(errMessage: 'No user found for that email.'));
      } else if (e.code == 'wrong-password') {
        emit(LoginFailureState(
            errMessage: 'Wrong password provided for that user.'));
      } else if (e.code == 'invalid-email') {
        emit(LoginFailureState(
            errMessage: 'The email address is badly formatted.'));
      } else if (e.code == 'invalid-credential') {
        emit(LoginFailureState(errMessage: 'The email or password is wrong.'));
      } else if (e.code == 'too-many-requests') {
        emit(LoginFailureState(
            errMessage: 'Too many login attempts. Please try again later.'));
      } else if (e.code == 'network-request-failed') {
        emit(LoginFailureState(
            errMessage: 'Network error. Please check your connection.'));
      } else {
        emit(LoginFailureState(errMessage: 'The email or password is wrong'));
      }
    } catch (e) {
      emit(LoginFailureState(errMessage: 'An unexpected error occurred.'));
    }
  }
}

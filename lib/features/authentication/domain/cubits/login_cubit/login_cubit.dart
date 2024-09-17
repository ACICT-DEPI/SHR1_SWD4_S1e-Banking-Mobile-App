import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../../core/network/firebase.dart';
import '../../../data/models/user_model.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitialState());

  Future<void> userLogin({
    required String email,
    required String password,
  }) async {
    emit(LoginLoadingState());
    try {
      UserModel? user = await FirebaseService.loginUser(
        email: email,
        password: password,
      );

      if (user != null) {
        emit(LoginSuccessState(user: user));
      } else {
        emit(LoginFailureState(errMessage: 'Login failed. Please try again.'));
      }
    } on FirebaseAuthException catch (e) {
      String errorMessage;
      switch (e.code) {
        case 'user-not-found':
          errorMessage = 'No user found for that email.';
          break;
        case 'wrong-password':
          errorMessage = 'Wrong password provided for that user.';
          break;
        case 'invalid-email':
          errorMessage = 'The email address is badly formatted.';
          break;
        case 'invalid-credential':
          errorMessage = 'The email or password is wrong.';
          break;
        case 'too-many-requests':
          errorMessage = 'Too many login attempts. Please try again later.';
          break;
        case 'network-request-failed':
          errorMessage = 'Network error. Please check your connection.';
          break;
        default:
          errorMessage = 'An unexpected error occurred.';
      }
      emit(LoginFailureState(errMessage: errorMessage));
    } catch (e) {
      emit(LoginFailureState(errMessage: 'An unexpected error occurred.'));
    }
  }
}

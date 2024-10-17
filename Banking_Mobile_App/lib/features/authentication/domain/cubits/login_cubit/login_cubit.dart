import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../core/network/firebase_authentication.dart';
import '../../../../../generated/l10n.dart';
import '../../../data/models/user_model.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitialState());

  Future<void> userLogin(
      {required String email,
      required String password,
      required BuildContext context}) async {
    emit(LoginLoadingState());
    try {
      UserModel? user = await FirebaseAuthentication.loginUser(
        email: email,
        password: password,
      );

      if (user != null) {
        emit(LoginSuccessState(user: user));
      } else {
        emit(LoginFailureState(errMessage: S.of(context).LoginFailedTryAgain));
      }
    } on FirebaseAuthException catch (e) {
      String errorMessage;
      switch (e.code) {
        case 'user-not-found':
          errorMessage = S.of(context).NoUserFound;
          break;
        case 'wrong-password':
          errorMessage = S.of(context).WrongPassword;
          break;
        case 'invalid-email':
          errorMessage = S.of(context).EmailBadlyFormatted;
          break;
        case 'invalid-credential':
          errorMessage = S.of(context).EmailOrPasswordWrong;
          break;
        case 'too-many-requests':
          errorMessage = S.of(context).ManyLoginAttempts;
          break;
        case 'network-request-failed':
          errorMessage = S.of(context).NetworkError;
          break;
        default:
          errorMessage = S.of(context).UnexpectedError;
      }
      emit(LoginFailureState(errMessage: errorMessage));
    } catch (e) {
      emit(LoginFailureState(errMessage: S.of(context).UnexpectedError));
    }
  }
}

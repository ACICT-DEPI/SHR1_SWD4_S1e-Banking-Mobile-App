import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import '../../../../../core/network/firebase_authentication.dart';
import '../../../../../generated/l10n.dart';
import '../../../data/models/user_model.dart';
import 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitialState());

  /// Registers a new user using the provided [UserModel].
  Future<void> userRegister(
      {required UserModel user, required BuildContext context}) async {
    emit(
        SignUpLoadingState()); // Emit loading state while registration is in progress
    try {
      // Call the Firebase method to register the user
      await FirebaseAuthentication.signUpUser(user);

      // Emit success state if registration is successful
      emit(SignUpSuccessState());
    } on FirebaseAuthException catch (e) {
      // Handle specific FirebaseAuth exceptions and emit corresponding failure state
      String errorMessage;
      switch (e.code) {
        case 'weak-password':
          errorMessage = S.of(context).PasswordWeak;
          break;
        case 'email-already-in-use':
          errorMessage = S.of(context).EmailInUse;
          break;
        case 'invalid-email':
          errorMessage = S.of(context).EmailBadlyFormatted;
          break;
        case 'operation-not-allowed':
          errorMessage = S.of(context).EmailPasswordNotEnabled;
          break;
        default:
          errorMessage = S.of(context).UnexpectedError;
      }
      emit(SignUpFailureState(errMessage: errorMessage));
    } catch (e) {
      // Catch any other exceptions and emit a general failure state
      emit(SignUpFailureState(errMessage: S.of(context).UnexpectedError));
    }
  }
}

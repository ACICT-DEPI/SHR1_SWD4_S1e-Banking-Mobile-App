import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../../core/network/firebase.dart';
import '../../../data/models/user_model.dart';
import 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitialState());

  /// Registers a new user using the provided [UserModel].
  Future<void> userRegister({required UserModel user}) async {
    emit(
        SignUpLoadingState()); // Emit loading state while registration is in progress
    try {
      // Call the Firebase method to register the user
      await Firebase.signUpUser(user);

      // Emit success state if registration is successful
      emit(SignUpSuccessState());
    } on FirebaseAuthException catch (e) {
      // Handle specific FirebaseAuth exceptions and emit corresponding failure state
      String errorMessage;
      switch (e.code) {
        case 'weak-password':
          errorMessage = 'The password is too weak.';
          break;
        case 'email-already-in-use':
          errorMessage = 'The email address is already in use.';
          break;
        case 'invalid-email':
          errorMessage = 'The email address is badly formatted.';
          break;
        case 'operation-not-allowed':
          errorMessage = 'Email/password accounts are not enabled.';
          break;
        default:
          errorMessage = 'An unknown error occurred.';
      }
      emit(SignUpFailureState(errMessage: errorMessage));
    } catch (e) {
      // Catch any other exceptions and emit a general failure state
      emit(SignUpFailureState(errMessage: 'An unexpected error occurred.'));
    }
  }
}

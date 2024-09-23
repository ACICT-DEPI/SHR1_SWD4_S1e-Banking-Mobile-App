import 'package:bank_app/core/network/firebase_service.dart';

class EditUserRepo {
  Future<void> updateUser({
    required String fullName,
    required String emailAddress,
    required String phoneNumber,
  }) async {
    await FirebaseService.updateUser(
      fullName: fullName,
      emailAddress: emailAddress,
      phoneNumber: phoneNumber,
    );
  }
}

import 'package:bank_app/core/network/firebase_service.dart';

class EditUserRepo {
  Future<void> updateUser({
    required String fullName,
    required String emailAddress,
    required String phoneNumber,
    required int birthDay,
    required int birthMonth,
    required int birthYear,
  }) async {
    await FirebaseService.updateUser(
      fullName: fullName,
      emailAddress: emailAddress,
      phoneNumber: phoneNumber,
      birthDay: birthDay,
      birthMonth: birthMonth,
      birthYear: birthYear,
    );
  }
}

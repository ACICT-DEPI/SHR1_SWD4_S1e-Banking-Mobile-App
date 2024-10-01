import '../../../../core/network/firebase_service.dart';

class ChangePasswordRepo {
  updatePassword(String newPassword) async {
    await FirebaseService.changePassword(newPassword: newPassword);
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../features/authentication/data/models/user_model.dart';
import 'firebase_authentication.dart';

class FirebaseService {
  static final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  static final CollectionReference _userCollection =
      _fireStore.collection('users');

  // static final String _userId = FirebaseAuthentication.getUserId();
  //
  // static final DocumentReference _userDocument = _userCollection.doc(_userId);

  static final FirebaseAuth _auth = FirebaseAuth.instance;

  static Future<List<UserModel>> getAllUsers() async {
    List<UserModel> allUsers = [];

    // Fetch all documents in the 'users' collection
    var querySnapshot = await _userCollection.get();

    // Loop through the documents and add them to the list
    for (var userDoc in querySnapshot.docs) {
      allUsers.add(
        UserModel.fromJson(userDoc.data()),
      );
    }

    return allUsers;
  }

  static Future<UserModel?> getUser(String userId) async {
    UserModel? userModel;

    // Fetch all documents in the 'users' collection
    var querySnapshot = await _userCollection.get();

    for (var userDoc in querySnapshot.docs) {
      UserModel user = UserModel.fromJson(userDoc.data());
      if (user.userId == userId) {
        userModel = user;
        break;
      }
    }

    return userModel;
  }

  static Future<void> updateUser({
    String? fullName,
    String? phoneNumber,
    String? password,
    String? image,
    int? birthDay,
    int? birthMonth,
    int? birthYear,
    double? monthlyLimit,
  }) async {
    UserModel defaultUser = await FirebaseAuthentication.getUserModel();

    UserModel updatedUser = UserModel(
      fullName: fullName ?? defaultUser.fullName,
      phoneNumber: phoneNumber ?? defaultUser.phoneNumber,
      emailAddress: defaultUser.emailAddress,
      password: password ?? defaultUser.password,
      birthDay: birthDay ?? defaultUser.birthDay,
      birthMonth: birthMonth ?? defaultUser.birthMonth,
      birthYear: birthYear ?? defaultUser.birthYear,
      monthlyLimit: monthlyLimit ?? defaultUser.monthlyLimit,
      image: image ?? defaultUser.image,
      joinedAt: defaultUser.joinedAt,
      userId: defaultUser.userId,
    );

    await _fireStore.collection('users').doc(defaultUser.userId).set(
          UserModel.toJson(updatedUser),
        );
  }

  static Future<void> changePassword({
    required String newPassword,
  }) async {
    User? user = _auth.currentUser;
    if (user != null) {
      UserModel defaultUser = await FirebaseAuthentication.getUserModel();
      AuthCredential credential = EmailAuthProvider.credential(
        email: defaultUser.emailAddress,
        password: defaultUser.password,
      );

      await user.reauthenticateWithCredential(credential);

      await user.updatePassword(newPassword);

      await updateUser(password: newPassword);
    }
  }
}

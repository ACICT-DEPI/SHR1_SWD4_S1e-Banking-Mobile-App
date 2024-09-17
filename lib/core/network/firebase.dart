import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../features/authentication/data/models/user_model.dart';
import '../helpers/functions.dart';

class Firebase {
  // Firebase Authentication instance
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  // Firebase FireStore instance
  static final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  // Method to register a new user using email and password
  static Future<void> signUpUser(UserModel user) async {
    try {
      // Creating a new user with Firebase Authentication
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: user.emailAddress,
        password: user.password,
      );
      // Assign the unique user ID from Firebase Auth to the user model
      user.userId = userCredential.user!.uid;

      user.joinedAt = Functions.getCurrentDate();

      // Store the user data in FireStore under the 'users' collection
      await _fireStore.collection('users').doc(user.userId).set(
            UserModel.toJson(user),
          );
    } catch (e) {
      // Handle any exceptions that occur during the sign-up process
    }
  }

  // Method to log in a user with email and password
  static Future<UserModel?> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      // Sign in with Firebase Authentication using email and password
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Retrieve the user ID from the signed-in user
      String userId = userCredential.user!.uid;
      // Return the user data as a UserModel
      return getUserInformation(userId);
    } catch (e) {
      // Handle any exceptions that occur during the login process
    }
    return null;
  }

  // Method to retrieve user information from FireStore based on user ID
  static Future<UserModel?> getUserInformation(String userId) async {
    // Reference to the 'users' collection in FireStore
    CollectionReference users = _fireStore.collection('users');

    try {
      // Get the user document from FireStore using the provided user ID
      DocumentSnapshot userSnapshot = await users.doc(userId).get();

      // If the user document exists, convert it to a UserModel
      if (userSnapshot.exists) {
        Map<String, dynamic>? userJson =
            userSnapshot.data() as Map<String, dynamic>?;
        // Return the user data as a UserModel if the document contains data
        if (userJson != null) {
          return UserModel.fromJson(userJson);
        }
      }
    } catch (e) {
      // Handle any exceptions that occur during the data retrieval process
    }

    // If no user data is found or an error occurs, return null
    return null;
  }
}

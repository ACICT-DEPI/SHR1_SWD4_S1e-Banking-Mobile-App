import 'package:cloud_firestore/cloud_firestore.dart';
import '../../features/settings/data/models/settings_model.dart';
import 'firebase_authentication.dart';

class FirebaseSettings {
  // FireStore instance to interact with the database
  static final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  // Reference to the 'users' collection in Firestore
  static final CollectionReference _userCollection =
      _fireStore.collection('users');

  // Retrieve the current user's ID from the Firebase Authentication module
  static final String _userId = FirebaseAuthentication.getUserId();

  // Reference to the current user's document in the 'users' collection
  static final DocumentReference _userDocument = _userCollection.doc(_userId);

  /// Adds new settings (or settings in this case) to the user's 'settings' collection
  /// [settingsModel] is the model object to be stored as a FireStore document.
  static Future<void> addSettings(
    SettingsModel settingsModel,
  ) async {
    // Adds a new document with the notification settings to the 'settings' collection
    // within the user's document. FireStore will automatically generate a document ID.
    await _userDocument.collection('settings').add(
          SettingsModel.toJson(
            settingsModel,
          ),
        );
  }

  /// Retrieves the first settings document from the user's 'settings' collection.
  /// Returns a [SettingsModel] by converting the FireStore document data to a Dart object.
  static Future<SettingsModel?> getSettings() async {
    // Get all documents from the 'settings' collection of the current user.
    final QuerySnapshot notificationsCollection =
        await _userDocument.collection('settings').get();

    if (notificationsCollection.docs.isEmpty) {
      return null;
    }

    // Assuming that you want the first document from the 'settings' collection,
    // it converts the FireStore document to a SettingsModel.
    return SettingsModel.fromJson(
      notificationsCollection.docs.first.data() as Map<String, dynamic>,
    );
  }

  /// Updates the first notification settings document in the 'settings' collection.
  /// If the document exists, it will merge the updated fields with the existing data.
  static Future<void> updateSettings(
    SettingsModel settingsModel,
  ) async {
    // Fetches all documents from the 'settings' collection for the current user.
    final QuerySnapshot settingsCollection =
        await _userDocument.collection('settings').get();

    // Ensure the collection is not empty before trying to update.
    if (settingsCollection.docs.isNotEmpty) {
      // Get a reference to the first document in the 'notifications' collection.
      final DocumentReference docRef = settingsCollection.docs.first.reference;

      // Use the set() method on the document reference to update it.
      // The merge: true option ensures that only the provided fields are updated
      // while keeping the other fields intact (i.e., merge the data).
      await docRef.set(
        SettingsModel.toJson(settingsModel),
        SetOptions(merge: true),
      );
    }
  }
}

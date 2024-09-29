import '../../../../core/helpers/functions.dart';
import '../../../../core/network/firebase_settings.dart';
import '../models/settings_model.dart';

class SettingsRepo {
  getSettingsModel() async {
    SettingsModel? settingsModel = await FirebaseSettings.getSettings();
    if (settingsModel == null) {
      bool biometricSupport = await Functions.checkBiometricSupport();
      await FirebaseSettings.addSettings(
        SettingsModel(
          language: Functions.getDeviceLanguage(),
          useBiometric: biometricSupport == true ? true : null,
          appPassword: null,
          themeMode: 'Light',
        ),
      );
    }
    return await FirebaseSettings.getSettings();
  }
}

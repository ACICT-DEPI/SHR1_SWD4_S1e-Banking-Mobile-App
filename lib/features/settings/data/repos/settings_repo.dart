import '../../../../core/helpers/functions.dart';
import '../../../../core/local/local_settings.dart';
import '../models/settings_model.dart';

class SettingsRepo {
  getSettingsModel() async {
    SettingsModel? settingsModel = await LocalSettings.getSettings();
    if (settingsModel == null) {
      bool biometricSupport = await Functions.checkBiometricSupport();
      await LocalSettings.addSettings(
        SettingsModel(
          language: Functions.getDeviceLanguage(),
          useBiometric: false,
          appPassword: 0,
          themeMode: 'Light',
          supportBiometric: biometricSupport == true ? true : false,
        ),
      );
    }
    return await LocalSettings.getSettings();
  }

  updateSettings(SettingsModel model) async {
    await LocalSettings.updateSettings(model);
  }
}

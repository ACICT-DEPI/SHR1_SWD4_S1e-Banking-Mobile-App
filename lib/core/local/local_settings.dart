import 'package:hive/hive.dart';

import '../../features/settings/data/models/settings_model.dart';
import '../helpers/functions.dart';

class LocalSettings {
  static final _settingsBox = Hive.box<SettingsModel>("settings");

  static Future<void> addSettings(SettingsModel settingsModel) async {
    await _settingsBox.add(settingsModel);
  }

  static SettingsModel getSettings() {
    SettingsModel settingsModel = _settingsBox.values.first;

    return settingsModel;
  }

  static Future<void> initializeSettings() async {
    SettingsModel? settingsModel = _settingsBox.values.firstOrNull;

    bool checkBiometricSupport = await Functions.checkBiometricSupport();

    if (settingsModel == null) {
      addSettings(
        SettingsModel(
          language: Functions.getDeviceLanguage(),
          appPassword: -1,
          useBiometric: false,
          supportBiometric: checkBiometricSupport,
          themeMode: 'Light',
        ),
      );
    }
  }

  static Future<void> updateSettings(
    SettingsModel settingsModel,
  ) async {
    await _settingsBox.putAt(0, settingsModel);
  }
}

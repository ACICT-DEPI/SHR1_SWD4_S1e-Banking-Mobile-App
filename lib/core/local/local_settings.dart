import 'package:hive/hive.dart';

import '../../features/settings/data/models/settings_model.dart';

class LocalSettings {
  static final _settingsBox = Hive.box<SettingsModel>("settings");

  static Future<void> addSettings(SettingsModel settingsModel) async {
    await _settingsBox.add(settingsModel);
  }

  static Future<SettingsModel?> getSettings() async {
    SettingsModel? settingsModel = _settingsBox.values.firstOrNull;

    if (settingsModel == null) {
      return null;
    }

    return settingsModel;
  }

  static Future<void> updateSettings(
    SettingsModel settingsModel,
  ) async {
    await _settingsBox.putAt(0, settingsModel);
  }
}

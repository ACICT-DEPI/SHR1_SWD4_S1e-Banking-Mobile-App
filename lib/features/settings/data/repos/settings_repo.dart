import '../../../../core/local/local_settings.dart';
import '../models/settings_model.dart';

class SettingsRepo {
  getSettingsModel() async {
    await LocalSettings.initializeSettings();

    return LocalSettings.getSettings();
  }

  updateSettings(SettingsModel model) async {
    await LocalSettings.updateSettings(model);
  }
}

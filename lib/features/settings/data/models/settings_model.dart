class SettingsModel {
  String language;
  int? appPassword;
  String themeMode;
  bool? useBiometric;

  SettingsModel({
    required this.language,
    this.appPassword,
    this.themeMode = 'light',
    this.useBiometric,
  });

  factory SettingsModel.fromJson(json) {
    return SettingsModel(
      language: json['language'],
      appPassword: json['appPassword'],
      themeMode: json['themeMode'],
      useBiometric: json['useBiometric'],
    );
  }

  static toJson(SettingsModel model) {
    return {
      'language': model.language,
      'appPassword': model.appPassword,
      'themeMode': model.themeMode,
      'useBiometric': model.useBiometric,
    };
  }
}

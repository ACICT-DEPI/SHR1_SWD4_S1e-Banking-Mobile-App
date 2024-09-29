import 'package:hive/hive.dart';

part 'settings_model.g.dart';

@HiveType(typeId: 0)
class SettingsModel {
  @HiveField(0)
  String language;
  @HiveField(1)
  int appPassword;
  @HiveField(2)
  String themeMode;
  @HiveField(3)
  bool useBiometric;
  @HiveField(4)
  bool supportBiometric;

  SettingsModel({
    required this.language,
    required this.appPassword,
    this.themeMode = 'light',
    required this.useBiometric,
    required this.supportBiometric,
  });
}

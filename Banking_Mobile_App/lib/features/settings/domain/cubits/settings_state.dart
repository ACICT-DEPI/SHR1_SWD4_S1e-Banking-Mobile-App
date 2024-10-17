part of 'settings_cubit.dart';

@immutable
sealed class SettingsState {}

final class SettingsInitial extends SettingsState {}

final class SettingsLoading extends SettingsState {}

final class SettingsSuccess extends SettingsState {
  final SettingsModel settingsModel;

  SettingsSuccess({required this.settingsModel});
}

final class SettingsFailed extends SettingsState {
  final String errMessage;

  SettingsFailed({required this.errMessage});
}

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/models/settings_model.dart';
import '../../data/repos/settings_repo.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(SettingsInitial());
  final SettingsRepo _settingsRepo = SettingsRepo();

  getSettingsModel() async {
    emit(SettingsLoading());
    try {
      SettingsModel settingsModel = await _settingsRepo.getSettingsModel();
      emit(SettingsSuccess(settingsModel: settingsModel));
    } catch (e) {
      emit(SettingsFailed(errMessage: e.toString()));
    }
  }

  updateSettingsModel(SettingsModel model) async {
    emit(SettingsLoading());
    try {
      await _settingsRepo.updateSettings(model);
      getSettingsModel();
    } catch (e) {
      emit(SettingsFailed(errMessage: e.toString()));
    }
  }
}

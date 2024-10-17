// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_model.dart';

// ***************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SettingsModelAdapter extends TypeAdapter<SettingsModel> {
  @override
  final int typeId = 0;

  @override
  SettingsModel read(BinaryReader reader) {
    return SettingsModel(
      language: reader.readString(),
      appPassword: reader.readInt(),
      themeMode: reader.readString(),
      useBiometric: reader.readBool(),
      supportBiometric: reader.readBool(),
      isLogIn: reader.readBool(),
    );
  }

  @override
  void write(BinaryWriter writer, SettingsModel obj) {
    writer.writeString(obj.language);
    writer.writeInt(obj.appPassword);
    writer.writeString(obj.themeMode);
    writer.writeBool(obj.useBiometric);
    writer.writeBool(obj.supportBiometric);
    writer.writeBool(obj.isLogIn);
  }
}

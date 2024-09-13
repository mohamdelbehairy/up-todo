// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'open_first_time_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OpenFirstTimeModelAdapter extends TypeAdapter<OpenFirstTimeModel> {
  @override
  final int typeId = 1;

  @override
  OpenFirstTimeModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OpenFirstTimeModel(
      isOpen: fields[0] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, OpenFirstTimeModel obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.isOpen);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OpenFirstTimeModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

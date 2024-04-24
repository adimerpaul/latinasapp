// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Book.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BookAdapter extends TypeAdapter<Book> {
  @override
  final int typeId = 0;

  @override
  Book read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Book(
      id: fields[0] as int,
      name: fields[1] as String?,
      author: fields[2] as String?,
      image: fields[4] as String?,
      description: fields[5] as String?,
      price: fields[6] as double?,
      quantity: fields[7] as int?,
      total: fields[8] as double?,
    );
  }

  @override
  void write(BinaryWriter writer, Book obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.author)
      ..writeByte(4)
      ..write(obj.image)
      ..writeByte(5)
      ..write(obj.description)
      ..writeByte(6)
      ..write(obj.price)
      ..writeByte(7)
      ..write(obj.quantity)
      ..writeByte(8)
      ..write(obj.total);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BookAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

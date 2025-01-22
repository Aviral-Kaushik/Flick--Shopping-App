// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Product.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductAdapter extends TypeAdapter<Product> {
  @override
  final int typeId = 1;

  @override
  Product read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Product(
      id: fields[0] as String,
      productName: fields[1] as String,
      productDescription: fields[2] as String,
      productImages: (fields[3] as List).cast<String>(),
      productRating: fields[4] as double,
      productPrice: fields[5] as int,
      totalPurchases: fields[6] as int,
      stock: fields[7] as int,
      sellerName: fields[8] as String,
      productCategory: fields[9] as String,
      availableColors: (fields[10] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, Product obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.productName)
      ..writeByte(2)
      ..write(obj.productDescription)
      ..writeByte(3)
      ..write(obj.productImages)
      ..writeByte(4)
      ..write(obj.productRating)
      ..writeByte(5)
      ..write(obj.productPrice)
      ..writeByte(6)
      ..write(obj.totalPurchases)
      ..writeByte(7)
      ..write(obj.stock)
      ..writeByte(8)
      ..write(obj.sellerName)
      ..writeByte(9)
      ..write(obj.productCategory)
      ..writeByte(10)
      ..write(obj.availableColors);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

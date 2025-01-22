// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_product.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OrderProductAdapter extends TypeAdapter<OrderProduct> {
  @override
  final int typeId = 2;

  @override
  OrderProduct read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OrderProduct(
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
      quantity: fields[11] as int,
    );
  }

  @override
  void write(BinaryWriter writer, OrderProduct obj) {
    writer
      ..writeByte(12)
      ..writeByte(11)
      ..write(obj.quantity)
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
      other is OrderProductAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) {
  return ProductModel(
    id: json['id'] as int,
    name: json['name'] as String,
    description: json['description'] as String,
    sum: json['sum'] as String,
    imgUrl1: json['imgUrl1'] as String,
    imgIcon: json['imgIcon'] as String,
    price: (json['price'] as num)?.toDouble(),
    specialOffer: json['specialOffer'] as bool,
  );
}

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'sum': instance.sum,
      'imgUrl1': instance.imgUrl1,
      'imgIcon': instance.imgIcon,
      'price': instance.price,
      'specialOffer': instance.specialOffer,
    };

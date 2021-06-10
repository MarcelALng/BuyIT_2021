// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) {
  return $checkedNew('ProductModel', json, () {
    $checkKeys(json,
        requiredKeys: const ['name', 'sum', 'img_icon', 'price'],
        disallowNullValues: const ['name', 'sum', 'img_icon', 'price']);
    final val = ProductModel(
      id: $checkedConvert(json, 'id', (v) => v as int),
      name: $checkedConvert(json, 'name', (v) => v as String),
      description: $checkedConvert(json, 'description', (v) => v as String),
      sum: $checkedConvert(json, 'sum', (v) => v as String),
      imgUrl1: $checkedConvert(json, 'img_1', (v) => v as String),
      imgIcon: $checkedConvert(json, 'img_icon', (v) => v as String),
      price: $checkedConvert(json, 'price', (v) => (v as num)?.toDouble()),
      specialOffer:
          $checkedConvert(json, 'special-offer', (v) => v as bool) ?? false,
    );
    return val;
  }, fieldKeyMap: const {
    'imgUrl1': 'img_1',
    'imgIcon': 'img_icon',
    'specialOffer': 'special-offer'
  });
}

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) {
  final val = <String, dynamic>{
    'id': instance.id,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  val['description'] = instance.description;
  writeNotNull('sum', instance.sum);
  val['img_1'] = instance.imgUrl1;
  writeNotNull('img_icon', instance.imgIcon);
  writeNotNull('price', instance.price);
  val['special-offer'] = instance.specialOffer;
  return val;
}

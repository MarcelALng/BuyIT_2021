import 'package:meta/meta.dart';
// import 'package:json_serializable/json_serializable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_model.g.dart';

@JsonSerializable(checked: true)
class ProductModel {
  int id;
  @JsonKey(required: true, disallowNullValue: true)
  String name;
  String description;
  @JsonKey(required: true, disallowNullValue: true)
  String sum;
  @JsonKey(name: 'img_1')
  String imgUrl1;
  @JsonKey(name: 'img_icon', required: true, disallowNullValue: true)
  String imgIcon;
  @JsonKey(required: true, disallowNullValue: true)
  double price;
  @JsonKey(name: 'special-offer', defaultValue: false)
  bool specialOffer;

  ProductModel(
      {this.id,
      @required this.name,
      @required this.description,
      @required this.sum,
      @required this.imgUrl1,
      @required this.imgIcon,
      @required this.price,
      this.specialOffer = false});

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  toJson() => _$ProductModelToJson(this);
}

import 'package:meta/meta.dart';
import 'package:json_serializable/json_serializable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_model.g.dart';

@JsonSerializable()
class ProductModel {
  int id;
  String name;
  String description;
  String sum;
  String imgUrl1;
  String imgIcon;
  double price;
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
}

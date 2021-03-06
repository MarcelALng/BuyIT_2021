import 'package:buyit_2021/constants/global_constant.dart';
import 'package:buyit_2021/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductCardComponent extends StatelessWidget {
  final ProductModel productData;

  ProductCardComponent({@required this.productData});
  @override
  Widget build(BuildContext context) {
    String _priceText = productData.price.toString() + '€';
    String _sumText = productData.sum.length > 60
        ? productData.sum.substring(0, 60)
        : productData.sum;
    return Container(
      height: 280,
      child: Card(
        margin: EdgeInsets.all(8.0),
        child: ClipRect(
          child: Banner(
            color: Theme.of(context).bannerTheme.backgroundColor,
            message: "Promo!",
            location: BannerLocation.topStart,
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Row(
                children: [
                  Flexible(
                    child: FadeInImage(
                      placeholder: AssetImage("assets/preloader.gif"),
                      image: NetworkImage(productData.imgIcon),
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              Center(
                                child: Text(
                                  productData.name,
                                  style:
                                      GlobalConstant.getFonts2(fontSize: 20.0),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 18.0),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              _sumText,
                              style: TextStyle(),
                            ),
                          ),
                          SizedBox(height: 18.0),
                          Center(
                            child: Text(
                              _priceText,
                              style: GlobalConstant.getFonts2(
                                  fontSize: 35.0, color: Colors.red),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

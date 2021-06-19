import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:buyit_2021/controllers/shop_controller.dart';
import 'components/product_card_component.dart';
import 'package:buyit_2021/models/product_model.dart';

class ShopScreen extends StatefulWidget {
  @override
  _ShopScreenState createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  final _c = ShopController();
  List<ProductModel> _productList;
  ScrollController _scrollController;

  void _scrollFunction() {
    _scrollController.position.maxScrollExtent.toString();

    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent * 0.90 &&
        !_scrollController.position.outOfRange) {
      _c.getPromo();
    }
  }

  @override
  void initState() {
    _productList = [];
    _scrollController = ScrollController()..addListener(_scrollFunction);
    _c.getPromo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: _c.getProductStream,
          builder: (context, AsyncSnapshot<List<ProductModel>> snap) {
            if (!snap
                .hasData /*&& snap.connectionState != ConnectionState.done*/)
              return CircularProgressIndicator();

            if (snap.data == null) return Text("Il n'y a pas de produit");

            _productList.addAll(snap.data);

            return ListView.builder(
              controller: _scrollController,
              itemBuilder: (context, item) {
                return ProductCardComponent(productData: _productList[item]);
              },
              itemCount: _productList.length,
            );
          }),
    );
  }
}

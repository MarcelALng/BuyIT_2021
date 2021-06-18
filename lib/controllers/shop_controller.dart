import 'dart:async';

import 'package:buyit_2021/models/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

class ShopController {
  final Firestore _db = Firestore.instance;
  QuerySnapshot _docs;
  DocumentSnapshot _lastDoc;

  final StreamController<QuerySnapshot> _streamController =
      StreamController<QuerySnapshot>();

  get getProductStream => _streamController.stream;

  bool noMoreProd = false;
  static const int _maxProductLoading = 3;
  static const _collectionFS = "products";
  static const _promoFieldFS = "special-offer";
  static const String _orderFieldFS = "name";

  void modelizeProductsList() async {
    QuerySnapshot _test;
    List<ProductModel> productsList = [];

    _test = await _db
        .collection(_collectionFS)
        .where(_promoFieldFS, isEqualTo: true)
        .orderBy(_orderFieldFS)
        .limit(_maxProductLoading)
        .getDocuments();
    _test.documents.map((productData) {
      Map<String, dynamic> _prodMap = {
        'id': int.parse(productData.documentID),
        ...productData.data
      };
      try {
        productsList.add(ProductModel.fromJson(_prodMap));
      } on CheckedFromJsonException catch (error) {
        print(error.message);
      }
    }).toList();
    productsList.forEach((prod) => print(prod.name));
  }

  void getPromo() async {
    modelizeProductsList();
    if (noMoreProd) return null;
    if (_lastDoc == null) {
      _docs = await _db
          .collection(_collectionFS)
          .where(_promoFieldFS, isEqualTo: true)
          .orderBy(_orderFieldFS)
          .limit(_maxProductLoading)
          .getDocuments();
    } else {
      _docs = await _db
          .collection(_collectionFS)
          .where(_promoFieldFS, isEqualTo: true)
          .orderBy(
              _orderFieldFS) //need to create index in firebaseDB, quite long time
          .startAfterDocument(_lastDoc)
          .limit(_maxProductLoading)
          .getDocuments();
    }
    if (_docs.documents.isNotEmpty) {
      _streamController.add(_docs);
      _lastDoc = _docs.documents.last;
    } else
      noMoreProd = true;
  }
}

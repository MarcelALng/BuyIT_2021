import 'dart:async';

import 'package:buyit_2021/models/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

class ShopController {
  final Firestore _db = Firestore.instance;
  List<ProductModel> _docs = [];
  DocumentSnapshot _lastDoc;

  final StreamController<List<ProductModel>> _streamController =
      StreamController<List<ProductModel>>();

  get getProductStream => _streamController.stream;

  bool noMoreProd = false;
  static const int _maxProductLoading = 3;
  static const _collectionFS = "products";
  static const _promoFieldFS = "special-offer";
  static const String _orderFieldFS = "name";

  void modelizeProductsList(List<DocumentSnapshot> docsSnaps) async {
    if (docsSnaps.isEmpty) {
      noMoreProd = true;
      return null;
    }
    // modelizeProductsList(_query.documents);

    docsSnaps.map((productData) {
      Map<String, dynamic> _prodMap = {
        'id': int.parse(productData.documentID),
        ...productData.data
      };
      try {
        _docs.add(ProductModel.fromJson(_prodMap));
      } on CheckedFromJsonException catch (error) {
        print(error.message);
        print(error.map);
        return null;
      }
    }).toList();
    _streamController.add(_docs);
    _lastDoc = docsSnaps.last;
    // productsList.forEach((prod) => print(prod.name));
  }

  void getPromo() async {
    QuerySnapshot _query;
    // modelizeProductsList();
    if (noMoreProd) return null;
    if (_lastDoc == null) {
      _query = await _db
          .collection(_collectionFS)
          .where(_promoFieldFS, isEqualTo: true)
          .orderBy(_orderFieldFS)
          .limit(_maxProductLoading)
          .getDocuments();
    } else {
      _query = await _db
          .collection(_collectionFS)
          .where(_promoFieldFS, isEqualTo: true)
          .orderBy(
              _orderFieldFS) //need to create index in firebaseDB, quite long time
          .startAfterDocument(_lastDoc)
          .limit(_maxProductLoading)
          .getDocuments();
    }
    modelizeProductsList(_query.documents);
  }
}

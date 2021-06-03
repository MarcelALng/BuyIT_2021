import 'package:cloud_firestore/cloud_firestore.dart';

class ShopController {
  final Firestore _db = Firestore.instance;
  QuerySnapshot _docs;
  DocumentSnapshot _lastDoc;
  bool noMoreProd = false;

  static const int _maxProductLoading = 2;
  static const _collectionFS = "products";
  static const _promoFieldFS = "special-offer";

  Future<QuerySnapshot> getPromo() async {
    if (noMoreProd) return null;
    if (_lastDoc == null) {
      _docs = await _db
          .collection(_collectionFS)
          .where(_promoFieldFS, isEqualTo: true)
          .limit(_maxProductLoading)
          .getDocuments();
    } else {
      _docs = await _db
          .collection(_collectionFS)
          .where(_promoFieldFS, isEqualTo: true)
          .startAfterDocument(_lastDoc)
          .limit(_maxProductLoading)
          .getDocuments();
    }
    if (_docs.documents.isNotEmpty) {
      _lastDoc = _docs.documents.last;
    }
    return _docs;
  }
}

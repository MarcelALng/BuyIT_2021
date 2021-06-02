import 'package:cloud_firestore/cloud_firestore.dart';

class ShopController {
  final Firestore _db = Firestore.instance;

  Future<QuerySnapshot> getPromo() async {
    return await _db
        .collection("products")
        .where("special-offer", isEqualTo: true)
        .getDocuments();
  }
}

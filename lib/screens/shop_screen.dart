import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:buyit_2021/controllers/shop_controller.dart';

class ShopScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _c = ShopController();
    _c.getPromo();
    return Scaffold(
      body: StreamBuilder(
          stream: _c.getProductStream,
          builder: (context, AsyncSnapshot<QuerySnapshot> snap) {
            if (!snap
                .hasData /*&& snap.connectionState != ConnectionState.done*/)
              return CircularProgressIndicator();
            return ListView.builder(
              itemBuilder: (context, item) {
                return Text(snap.data.documents[item]["name"]);
              },
              itemCount: snap.data.documents.length,
            );
          }),
    );
  }
}

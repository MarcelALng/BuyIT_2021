import 'package:flutter/material.dart';

import 'package:buyit_2021/controllers/shop_controller.dart';
class ShopScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _c = ShopController();
    return Scaffold(
      body: FutureBuilder(
        future: _c.getPromo(),
        builder: (context, snap) {
      
        return ListView.builder(itemBuilder: (context, item) {
          return Text(snap.data[item]["name"]);
        }
        itemCount: snap.data.length,
        );
      }),
    );
  }
}

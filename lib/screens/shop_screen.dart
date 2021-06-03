import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:buyit_2021/controllers/shop_controller.dart';

class ShopScreen extends StatefulWidget {
  @override
  _ShopScreenState createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  final _c = ShopController();

  ScrollController _scrollController;

  void _scrollerFunction() {
    if(){
      _c.getPromo();
    }
  }
  @override
  void initState() {
    _scrollController = ScrollController()..addListener(_scrollerFunction);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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

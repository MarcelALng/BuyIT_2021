import 'package:flutter/material.dart';

import "constants/routes_constants.dart";

import 'screens/screens.dart';

void main() => runApp(BuyITApp());

class BuyITApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "BuyITApp",
      initialRoute: RoutesConstants.register,
      routes: {
        RoutesConstants.login: (c) => LoginScreen(),
        RoutesConstants.register: (c) => RegisterScreen(),
        RoutesConstants.account: (c) => AccountScreen(),
        RoutesConstants.cart: (c) => CartScreen(),
        RoutesConstants.checkout: (c) => CheckoutScreen(),
        RoutesConstants.product: (c) => ProductScreen(),
        RoutesConstants.search: (c) => SearchScreen(),
        RoutesConstants.shop: (c) => ShopScreen(),
      },
      theme: ThemeData.dark(),
    );
  }
}

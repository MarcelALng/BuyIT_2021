import 'package:buyit_2021/screens/account_screen.dart';
import 'package:buyit_2021/screens/cart_screen.dart';
import 'package:buyit_2021/screens/checkout_screen.dart';
import 'package:buyit_2021/screens/login_screen.dart';
import 'package:buyit_2021/screens/product_screen.dart';
import 'package:buyit_2021/screens/register_screen.dart';
import 'package:buyit_2021/screens/search_screen.dart';
import 'package:buyit_2021/screens/shop_screen.dart';
import 'package:flutter/material.dart';

import "constants/routes_constants.dart";

void main() => runApp(BuyITApp());

class BuyITApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "BuyITApp",
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
    );
  }
}

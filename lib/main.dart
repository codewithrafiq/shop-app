import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './screens/add_product_screens.dart';
import './screens/cart_screens.dart';
import './screens/home_screens.dart';
import './screens/orders_screens.dart';
import './screens/product_details_screens.dart';
import './state/cartState.dart';
import './state/orderState.dart';
import './state/productState.dart';
import './screens/user_product_screens.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => ProductState(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => CartState(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => OrderState(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        debugShowCheckedModeBanner: false,
        routes: {
          HomeScreens.routeName: (ctx) => HomeScreens(),
          ProductDetailsScreens.routeName: (ctx) => ProductDetailsScreens(),
          CartScreens.routeName: (ctx) => CartScreens(),
          OrdersScreens.routeName: (ctx) => OrdersScreens(),
          UserProductScreens.routeName: (ctx) => UserProductScreens(),
          AddProductScreens.routeName: (ctx) => AddProductScreens(),
        },
      ),
    );
  }
}

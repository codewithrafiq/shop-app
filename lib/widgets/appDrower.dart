import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/screens/home_screens.dart';
import 'package:shopapp/screens/orders_screens.dart';
import 'package:shopapp/screens/user_product_screens.dart';
import 'package:shopapp/state/orderState.dart';
import 'package:shopapp/state/productState.dart';

class AppDrower extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<OrderState>(context).orders;
    final productData = Provider.of<ProductState>(context);
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: Text("Hello"),
            automaticallyImplyLeading: false,
          ),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.shop,
            ),
            title: Text("Shop"),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(HomeScreens.routeName);
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.ondemand_video),
            title: Text("Orders"),
            trailing: Text("${orderData.length}"),
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(OrdersScreens.routeName);
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.supervised_user_circle),
            title: Text("User"),
            trailing: Text(
              productData.product.length.toString(),
            ),
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(UserProductScreens.routeName);
            },
          ),
        ],
      ),
    );
  }
}

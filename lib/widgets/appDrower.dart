import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/screens/home_screens.dart';
import 'package:shopapp/screens/orders_screens.dart';
import 'package:shopapp/state/orderState.dart';

class AppDrower extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<OrderState>(context).orders;
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
        ],
      ),
    );
  }
}

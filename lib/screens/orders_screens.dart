import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/state/orderState.dart';
import 'package:shopapp/widgets/appDrower.dart';
import 'package:shopapp/widgets/singleOrder.dart';

class OrdersScreens extends StatefulWidget {
  static const routeName = '/order-screens';

  @override
  _OrdersScreensState createState() => _OrdersScreensState();
}

class _OrdersScreensState extends State<OrdersScreens> {
  @override
  Widget build(BuildContext context) {
    final orderDate = Provider.of<OrderState>(context);
    return Scaffold(
      drawer: AppDrower(),
      appBar: AppBar(
        title: Text("My Orders"),
      ),
      body: ListView.builder(
        itemCount: orderDate.orders.length,
        itemBuilder: (ctx, i) {
          var order = orderDate.orders[i];
          return SingleOrder(i, order);
        },
      ),
    );
  }
}

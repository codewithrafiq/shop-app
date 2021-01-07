import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/state/cartState.dart';
import 'package:shopapp/widgets/singleCartItem.dart';

class CartScreens extends StatelessWidget {
  static const routeName = '/cart-screens';
  @override
  Widget build(BuildContext context) {
    final cartData = Provider.of<CartState>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("My Cart"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Card(
              child: Row(
                children: [
                  Text(
                    "Total: ",
                    style: TextStyle(
                      fontSize: 22,
                    ),
                  ),
                  Text(
                    "\$${cartData.totalAmpunt}",
                    style: TextStyle(
                      fontSize: 22,
                    ),
                  ),
                  Spacer(),
                  RaisedButton(
                    onPressed: cartData.totalAmpunt == 0 ? null : () {},
                    child: Text("Order Now"),
                    color: Colors.red,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: cartData.cart.length,
              itemBuilder: (ctx, i) {
                var single_cart = cartData.cart.values.toList()[i];
                return SingleCartItem(
                  id: cartData.cart.keys.toList()[i],
                  title: single_cart.title,
                  price: single_cart.price,
                  quantity: single_cart.quantity,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

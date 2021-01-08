import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/screens/cart_screens.dart';
import 'package:shopapp/state/cartState.dart';
import 'package:shopapp/widgets/all_products.dart';
import 'package:shopapp/widgets/appDrower.dart';

class HomeScreens extends StatefulWidget {
  static const routeName = '/';

  @override
  _HomeScreensState createState() => _HomeScreensState();
}

class _HomeScreensState extends State<HomeScreens> {
  bool favoriteOnly = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrower(),
      appBar: AppBar(
        title: Text("Home"),
        actions: [
          PopupMenuButton(
            onSelected: (key) {
              setState(() {
                if (key == 0) {
                  favoriteOnly = false;
                } else {
                  favoriteOnly = true;
                }
              });
            },
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text("All Products"),
                value: 0,
              ),
              PopupMenuItem(
                child: Text("Favorites"),
                value: 1,
              ),
            ],
            icon: Icon(Icons.more_vert),
          ),
          Consumer<CartState>(
            builder: (ctx, data, cahild) {
              return RaisedButton.icon(
                color: Colors.green,
                onPressed: () {
                  Navigator.of(context).pushNamed(CartScreens.routeName);
                },
                icon: Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                ),
                label: Text(
                  data.cart.length.toString(),
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              );
            },
          )
        ],
      ),
      body: AllProducts(favoriteOnly),
    );
  }
}

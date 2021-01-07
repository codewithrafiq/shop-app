import 'package:flutter/material.dart';
import 'package:shopapp/widgets/all_products.dart';

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
          )
        ],
      ),
      body: AllProducts(favoriteOnly),
    );
  }
}

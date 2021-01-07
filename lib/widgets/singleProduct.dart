import 'package:flutter/material.dart';

class SingleProduct extends StatelessWidget {
  final String id;
  final String title;
  final double price;
  final String imageUrl;
  SingleProduct({
    this.id,
    this.title,
    this.price,
    this.imageUrl,
  });
  @override
  Widget build(BuildContext context) {
    return GridTile(
      header: GridTileBar(
        backgroundColor: Colors.black54,
        title: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 22,
          ),
        ),
      ),
      footer: GridTileBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.favorite_border,
            color: Colors.red,
          ),
        ),
        title: Text(
          "\$$price",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        trailing: Icon(
          Icons.shopping_cart,
          color: Colors.red,
        ),
      ),
      child: Image.network(
        imageUrl,
        height: 100,
        width: 100,
      ),
    );
  }
}

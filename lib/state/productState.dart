import 'package:flutter/cupertino.dart';
import 'package:shopapp/models/Product.dart';

class ProductState with ChangeNotifier {
  List<Product> _product = [
    Product(
      id: 'product_1',
      title: 'product title_1',
      description: 'Product Description_1',
      price: 11,
      imageUrl:
          'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__340.jpg',
    ),
    Product(
      id: 'product_2',
      title: 'product title_2',
      description: 'Product Description_2',
      price: 22,
      imageUrl:
          'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__340.jpg',
    ),
    Product(
      id: 'product_3',
      title: 'product title_3',
      description: 'Product Description_3',
      price: 33,
      imageUrl:
          'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__340.jpg',
    ),
    Product(
      id: 'product_4',
      title: 'product title_4',
      description: 'Product Description_4',
      price: 44,
      imageUrl:
          'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__340.jpg',
    ),
    Product(
      id: 'product_5',
      title: 'product title_5',
      description: 'Product Description_5',
      price: 55,
      imageUrl:
          'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__340.jpg',
    ),
    Product(
      id: 'product_6',
      title: 'product title_6',
      description: 'Product Description_6',
      price: 66,
      imageUrl:
          'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__340.jpg',
    ),
  ];

  List<Product> get product {
    return [..._product];
  }
}

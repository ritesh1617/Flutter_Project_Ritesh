import 'package:flutter/material.dart';

class Product {
  final String name;
  final String price;
  final String grams;
  final String imagePath;

  Product({
    required this.name,
    required this.price,
    required this.grams,
    required this.imagePath,
  });
}

class ProductProvider with ChangeNotifier {
  List<Product> _cart = [];
  List<Product> _wishlist = [];

  List<Product> get cart => _cart;
  List<Product> get wishlist => _wishlist;

  void addToCart(Product product) {
    _cart.add(product);
    notifyListeners();
  }

  void addToWishlist(Product product) {
    _wishlist.add(product);
    notifyListeners();
  }
}
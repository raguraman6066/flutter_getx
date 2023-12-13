import 'package:flutter/material.dart';
import 'package:flutter_getx/models/product.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  var cart = <Product>[].obs;
  var products = <Product>[
    Product(name: 'a', price: 10),
    Product(name: 'b', price: 11),
    Product(name: 'c', price: 12),
    Product(name: 'd', price: 13),
    Product(name: 'e', price: 14),
  ].obs;
  double get totalAmount {
    return cart.fold(
        0, (previousValue, element) => previousValue + element.price);
  }

  void addToCart(Product product) {
    cart.add(product);
  }

  void removeFromCart(int index) {
    cart.removeAt(index);
  }

  void checkout() {
    print('checkout successful');
  }
}

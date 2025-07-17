import 'package:flutter/material.dart';
import 'package:minimal_ecommare_app/models/product.dart';

class Shop extends ChangeNotifier{
  //products for sale
  final List<Product> _shop = [
    //product 1
    Product(
      name: "product1", 
    price: 99.99, 
    description: "item description.. more description...", 
    ),
    //product 2
    Product(
      name: "product2", 
    price: 109.99, 
    description: "item description..", 
    ),
    //product 3
    Product(
      name: "product3", 
    price: 125.25, 
    description: "item description..", 
    ),
    //product 3
    Product(
      name: "product4", 
    price: 89.99, 
    description: "item description..", 
    ),

  ];

  //user cart
  List<Product> _cart = [

  ];

  //get product list
  List<Product> get shop => _shop;

  //get user cart
  List<Product> get cart => _cart;

  //add item to cart
  void addToCart(Product item){
    _cart.add(item);
    notifyListeners();
  }

  //remove item from cart
  void removeFromcArt(Product item){
    _cart.remove(item);
    notifyListeners();
  }

}

import 'package:flutter/material.dart';
import 'package:minimal_ecommare_app/component/my_drawer.dart';
import 'package:minimal_ecommare_app/component/my_product_tile.dart';
import 'package:minimal_ecommare_app/models/product.dart';
import 'package:minimal_ecommare_app/models/shop.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {

    //access products in shop
    final products = context.watch<Shop>().shop;


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Alışveriş"),
      ),
      drawer: MyDrawer(),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: ListView(
        children: [
          const SizedBox(height: 25),
          //shop tile


          //subtitle tile
          Center(
            child: Text("Seçili ürünler arasından seçim yapın",
            style:TextStyle(
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            ),
            ),

          //product tile
          SizedBox(
        height: 550,
        child: ListView.builder(
          itemCount: products.length,
          scrollDirection: Axis.horizontal,
          padding:  const EdgeInsets.all(15),
          itemBuilder: (context, index) {
            //get each individual product from shop
            final product = products[index];
        
            //return as a product tile UI
            return MyProductTile(product: product);
          },
        
        ),
      ),
      ],
      )
    );
  }
}
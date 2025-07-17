import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:minimal_ecommare_app/component/my_button.dart';
import 'package:minimal_ecommare_app/component/my_drawer.dart';
import 'package:minimal_ecommare_app/models/product.dart';
import 'package:minimal_ecommare_app/models/shop.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  //remove item from cart method
  void removeItemFromCart(BuildContext context,Product product){
     //show a dialog box to ask user to confirm to remove from cart
    showDialog(
    context: context,
   builder: (context) => AlertDialog(
    content: const Text("Bu ürünü sepetinizden çıkarmak istiyor musunuz?"),
    actions: [
      //cancel button
      MaterialButton(
      onPressed: () => Navigator.pop(context),
      child: const Text("Çıkış"),
      //pop dialog box
      ),

      //yes button
       MaterialButton(
      onPressed: () {
      Navigator.pop(context);
      context.read<Shop>().removeFromcArt(product);
      }, 
      child: Text("Evet"),
      //pop dialog box
      ),
    ],
   ),
   );
  }

void payButtonPressed(BuildContext context){
  showDialog(context: context, 
  builder: (context)=> const AlertDialog(
    content: Text("Ödemeye yönlediriliyorsunuz"),
  ),
  );
}


  @override
  Widget build(BuildContext context) {
    //get access to the cart
    final cart = context.watch<Shop>().cart;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Sepet"),
      ),
      drawer: MyDrawer(),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          // cart list
          Expanded(child: ListView.builder(
            itemCount: cart.length,
            itemBuilder: (context, index) {
            //get individual item in cart
            final item = cart[index];

            //return as a cart tile UI
            return ListTile(
              title: Text(item.name),
              subtitle: Text(item.description),
              trailing: IconButton(
                icon: const Icon(Icons.remove),
                onPressed: () => removeItemFromCart(context,item), 
                ),
            );

          },
          ),
          ),

          // pay button
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: MyButton(onTap: () => payButtonPressed(context), 
            child: Text("ŞİMDİ ÖDE")),
          )
        ],
      ),
    );
  }
}
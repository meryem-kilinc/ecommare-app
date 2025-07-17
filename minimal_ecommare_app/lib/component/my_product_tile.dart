import 'package:flutter/material.dart';
import 'package:minimal_ecommare_app/models/product.dart';
import 'package:minimal_ecommare_app/models/shop.dart';
import 'package:provider/provider.dart';

class MyProductTile extends StatelessWidget {
  final Product product;

  const MyProductTile({super.key, 
  required this.product});

  //add to cart button pressed
  void addToCart(BuildContext context){
    //show a dialog box to ask user to confşrm to add to cart
    showDialog(
    context: context,
   builder: (context) => AlertDialog(
    content: Text("Bu ürünü mü eklemek istiyorsunuz?"),
    actions: [
      //cancel button
      MaterialButton(
      onPressed: () => Navigator.pop(context),
      child: Text("Çıkış"),
      //pop dialog box
      ),

      //yes button
       MaterialButton(
      onPressed: () {
        Navigator.pop(context);

        context.read<Shop>().addToCart(product);
      }, 
      child: Text("Evet"),
      //pop dialog box
      ),
    ],
   ),
   );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(15),
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(25),
      width: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              //product image
              AspectRatio(
                aspectRatio: 1,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  width: double.infinity,
                  padding: const EdgeInsets.all(25),
                  child: const Icon(Icons.favorite),
                ),
              ),

              const SizedBox(height: 25),

              //product name
              Text(
                product.name,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),

              const SizedBox(height: 10),

              // product description
              Text(
                product.description,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
            ],
          ),

          const SizedBox(height: 25),

          //product price+ add to cart bbutton
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            //product price
            Text('\$' + product.price.toStringAsFixed(2)),

             // add to cart button
             Container(
              decoration: BoxDecoration(
               color:  Theme.of(context).colorScheme.secondary,
               borderRadius: BorderRadius.circular(12)
              ),
              child: IconButton(
              onPressed: ()=> addToCart(context), 
             icon: const Icon(Icons.add)),
             ),
            ],
             ),
            ],
          ),
      );
   
  }
}

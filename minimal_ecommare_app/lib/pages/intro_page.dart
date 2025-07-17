import 'package:flutter/material.dart';
import 'package:minimal_ecommare_app/component/my_button.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //logo
          Icon(
            Icons.shopping_bag,
            size: 72,
            color: Theme.of(context).colorScheme.inversePrimary,
          ),

          const SizedBox( height: 25),

          //başlık
          Text("Kalite Cepte",
          style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 25),
          ),

          const SizedBox( height: 10),

          //altbaşlıklar
          Text("Herşeyin En İyisi",
          style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary,fontSize: 17),
          ),
          
            const SizedBox( height: 25),

          //buton
          MyButton(
          onTap: () => Navigator.pushNamed(context, '/shop_page'), 
          child: const Icon(Icons.arrow_forward))
        ],
      ),
      )
    );
  }
}
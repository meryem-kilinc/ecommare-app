import 'package:flutter/material.dart';
import 'package:minimal_ecommare_app/component/my_list_tile.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          //drawer headers: logo
          DrawerHeader(
            child: Icon(
              Icons.shopping_bag,
              size: 72,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),

          const SizedBox(height: 25),

          //shop tile
          MyListTile(
            text: "Alışveriş",
            icon: Icons.home_filled,
            onTap: () => Navigator.pop(context),
          ),

          //cart tile
          MyListTile(
            text: "Sepet",
            icon: Icons.shopping_bag_outlined,
            onTap: () {
              //pop drawer first
              Navigator.pop(context);

              //go to cart page
              Navigator.pushNamed(context,'/cart_page');
            },
          ),

          //exit
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: MyListTile(
              text: "Çıkış",
              icon: Icons.logout_outlined,
              onTap: () => Navigator.pushNamedAndRemoveUntil(
                context, '/intro_page', (route) => false),
            ),
          ),
        ],
      ),
    );
  }
}

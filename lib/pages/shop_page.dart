// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart/components/shoe_tile.dart';
import 'package:shopping_cart/models/cart.dart';
import 'package:shopping_cart/models/shoe.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {

  void addShoeToCart(Shoe shoe) {
    Provider.of<Cart>(context, listen: false).addItemToCart(shoe);
    showDialog(
      context: context, 
      builder: (context) => AlertDialog(
        title: const Text('Added to Cart'),
        content: const Text('Your item has been added to the cart'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          )
        ],
      )
    );
      

  }
  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
        builder: (context, value, child) => Column(
              children: [
                Container(
                    padding: const EdgeInsets.all(12),
                    margin: const EdgeInsets.all(25),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Row(children: [
                      Icon(Icons.search, color: Colors.grey),
                      SizedBox(width: 10),
                      Text('Search', style: TextStyle(color: Colors.grey)),
                    ])),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 25.0),
                  child: Text('Everyone flies, some fly higher than others.',
                      style: TextStyle(fontSize: 16, color: Colors.grey[600])),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Hot Picks 🔥',
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                      Text("See all",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue)),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Expanded(
                    child: ListView.builder(
                  itemCount: value.getShoeList().length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    Shoe shoe = value.getShoeList()[index];
                    return ShoeTile(
                      shoe: shoe,
                      onTap:() => addShoeToCart(shoe),
                    );
                  },
                )),
                const Padding(
                  padding: EdgeInsets.only(top: 25.0),
                  child: Divider(
                    color: Colors.white,
                  ),
                )
              ],
            ));
  }
}

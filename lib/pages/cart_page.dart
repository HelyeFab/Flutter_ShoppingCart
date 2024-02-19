import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart/components/cart_item.dart';
import 'package:shopping_cart/models/cart.dart';
import 'package:shopping_cart/models/shoe.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(builder: (context, value, child) => Padding(
      padding: const EdgeInsets.symmetric(horizontal:25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
          Text('My Cart', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
          SizedBox(height: 20,),
          Expanded(
            child: ListView.builder(
              itemCount: value.getCartList().length,
              itemBuilder: (context, index) {
                Shoe shoe = value.getCartList()[index];
                return  CartItem(
                  shoe: shoe,
                );
              },
            ),
          ),
        ]
      ),
    ),);
  }
}
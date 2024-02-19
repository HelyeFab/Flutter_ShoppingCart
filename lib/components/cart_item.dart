// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart/models/cart.dart';
import 'package:shopping_cart/models/shoe.dart';

class CartItem extends StatefulWidget {
  Shoe shoe;
   CartItem({
    super.key,
    required this.shoe,
    });

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
// remove shoe from cart
void removeItemFromCart(Shoe shoe){
  Provider.of<Cart>(context, listen: false).removeItemFromCart(widget.shoe);
}

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: Image.asset(widget.shoe.imagePath),
        title: Text(widget.shoe.name),
        subtitle: Text('\$${widget.shoe.price}'),
        trailing: IconButton(
          icon: const Icon(Icons.delete),
            onPressed: () => removeItemFromCart(widget.shoe),
        ),
      ),
    );
  }
}
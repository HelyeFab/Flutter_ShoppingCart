import 'package:flutter/material.dart';
import 'package:shopping_cart/models/shoe.dart';

class Cart extends ChangeNotifier{
 List <Shoe> shoeShop=[
    Shoe(
      name: 'Nike Air Max 90',
      description: 'The forward thinking design of Nike\'s latest shoes.',
      price: 120,
      imagePath: 'lib/assets/shoes/shoe3.png'
    
    ),
    Shoe(
      name: 'Nike Air Max 95',
      description: 'The forward thinking design of Nike\'s latest shoes.',
      price: 170,
      imagePath: 'lib/assets/shoes/shoe4.png'
    ),
    Shoe(
      name: 'Nike Air Max 97',
      description: 'The forward thinking design of Nike\'s latest shoes.',
      price: 160,
      imagePath: 'lib/assets/shoes/shoe5.png'
    ),
      ];

  List<Shoe> userCart = [];

  List<Shoe> getShoeList(){
    return shoeShop;
  }

  List<Shoe> getCartList(){
    return userCart;
  }

  void addItemToCart(Shoe shoe){
    userCart.add(shoe);
    notifyListeners();
  }

  void removeItemFromCart(Shoe shoe){
    userCart.remove(shoe);
    notifyListeners();
  }
}

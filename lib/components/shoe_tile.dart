import 'package:flutter/material.dart';
import 'package:shopping_cart/models/shoe.dart';

class ShoeTile extends StatelessWidget {
  Shoe shoe;
  void Function()? onTap;

  ShoeTile({super.key, required this.shoe, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 25),
      width: 280,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipRRect(
              child: Image.asset(
                shoe.imagePath,
              ),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12), topRight: Radius.circular(12))),
          Padding(
            padding: const EdgeInsets.only(left: 9.0),
            child: Text(shoe.description,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[800],
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 9.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(shoe.name,
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.grey[800],
                            fontWeight: FontWeight.bold)),
                    const SizedBox(height: 5),
                    Text('\$${shoe.price}', style: TextStyle(fontSize: 20))
                  ],
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(12),
                              bottomRight: Radius.circular(12))),
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 30,
                      )),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

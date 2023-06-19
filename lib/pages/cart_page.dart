import 'package:bubble_tea/components/drink_tile.dart';
import 'package:bubble_tea/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/drink.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  // remmove from dart
  void removeFromCart(Drink drink) {
    Provider.of(context, listen: false).removeFromCart(drink);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BubbleTeaShop>(
      builder: (context, value, child) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              // heading
              const Text(
                'Your cart',
                style: TextStyle(fontSize: 20),
              ),

              // adding spacing between cart items and title
              const SizedBox(height: 10),

              // list of cart items
              Expanded(
                child: ListView.builder(
                  itemCount: value.cart.length,
                  itemBuilder: (context, index) {
                    // get individual drink in the cart
                    Drink drink = value.cart[index];

                    // return as a nice tile
                    return DrinkTile(
                        drink: drink,
                        onTap: () => removeFromCart(drink),
                        trailing: const Icon(Icons.delete));
                  },
                ),
              ),
              // pay button
              MaterialButton(
                color: Colors.brown,
                child: const Text(
                  'PAY',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

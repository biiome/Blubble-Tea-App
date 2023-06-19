import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/shop.dart';
import '../models/drink.dart';

class OrderPage extends StatefulWidget {
  final Drink drink;
  const OrderPage({
    super.key,
    required this.drink,
  });

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  // customise sweetness
  double sweetValue = 0.5;

  void customizeSweet(double newValue) {
    setState(() {
      sweetValue = newValue;
    });
  }

  // customise ice
  double iceValue = 0.5;
  void customizeIce(double newValue) {
    setState(() {
      iceValue = newValue;
    });
  }

  // customise pearls
  double pearlValue = 0.5;
  void customizePearl(double newValue) {
    setState(() {
      pearlValue = newValue;
    });
  }

  // add to cart
  void addToCart() {
    // add drink to cart
    Provider.of<BubbleTeaShop>(context, listen: false).addToCart(widget.drink);

    // direct user back to shop page
    Navigator.pop(context);

    // let user know that the drink has beeen successfully added
    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        title: Text('Successfully added to cart'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[200],
      appBar: AppBar(
        title: Text(widget.drink.name),
      ),
      body: Column(
        children: [
          // drink image
          Image.asset(widget.drink.imagePath),

          // sliders to customize drink
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              children: [
                // sweetness slider
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(
                      child: SizedBox(
                        width: 100,
                        child: Text('Sweetness'),
                      ),
                    ),
                    Expanded(
                      child: Slider(
                        label: sweetValue.toString(),
                        value: sweetValue,
                        onChanged: (value) => customizeSweet(value),
                        divisions: 4,
                      ),
                    ),
                  ],
                ),

                // ice slider
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(
                      child: SizedBox(
                        width: 100,
                        child: Text('Ice'),
                      ),
                    ),
                    Expanded(
                      child: Slider(
                        label: iceValue.toString(),
                        value: iceValue,
                        onChanged: (value) => customizeIce(value),
                        divisions: 4,
                      ),
                    ),
                  ],
                ),

                // pearls slider
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(
                      child: SizedBox(
                        width: 100,
                        child: Text('Pearls'),
                      ),
                    ),
                    Expanded(
                      child: Slider(
                        label: pearlValue.toString(),
                        value: pearlValue,
                        onChanged: (value) => customizePearl(value),
                        divisions: 4,
                      ),
                    ),
                  ],
                ),

                // add spacing between sliders and cart button
                const SizedBox(height: 30),

                // add to cart button
                ButtonTheme(
                  minWidth: 275,
                  height: 60,
                  child: MaterialButton(
                    color: Colors.brown,
                    onPressed: addToCart,
                    child: const Text(
                      'Add to cart',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

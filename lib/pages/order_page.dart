import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[200],
      appBar: AppBar(
        title: Text(widget.drink.name),
      ),
      body: Column(
        children: [
          // image of the drink
          Image.asset(widget.drink.imagePath),

          // sliders to customize drink
          Column(
            children: [
              // sweetness slider
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Sweetness'),
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
                  const Text('Ice'),
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
                  const Text('Pearls'),
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
            ],
          )

          // add to cart button
        ],
      ),
    );
  }
}

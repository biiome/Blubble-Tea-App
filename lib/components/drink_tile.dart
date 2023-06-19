import 'package:flutter/material.dart';

import '../models/drink.dart';

class DrinkTile extends StatelessWidget {
  final Drink drink;
  final Widget trailing;
  void Function()? onTap;
  DrinkTile({
    super.key,
    required this.drink,
    required this.onTap,
    required this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 100,
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: const Color.fromRGBO(207, 198, 187, 1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ListTile(
                title: Text(drink.name),
                // subtitle: Text(drink.price),
                subtitle: Text('\$${drink.price}'),
                leading: Image.asset(drink.imagePath),
                trailing: trailing,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

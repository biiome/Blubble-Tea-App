import 'package:bubble_tea/models/drink.dart';
import 'package:flutter/material.dart';

class BubbleTeaShop extends ChangeNotifier {
  // list of drinks for sale
  final List<Drink> _shop = [
    // pearl milk tea
    Drink(
      name: 'Pearl Milk Tea',
      price: '4.80',
      imagePath: 'lib/images/milk_tea.png',
    ),
    Drink(
      name: 'Green Tea',
      price: '6.00',
      imagePath: 'lib/images/green_tea.png',
    ),
    Drink(
      name: 'Cream Tea',
      price: '6.00',
      imagePath: 'lib/images/cream_tea.png',
    ),
    Drink(
      name: 'Choco Tea',
      price: '4.00',
      imagePath: 'lib/images/choco_tea.png',
    ),
    Drink(
      name: 'Tea',
      price: '4.80',
      imagePath: 'lib/images/tea.png',
    ),
    Drink(
      name: 'Coffee',
      price: '5.00',
      imagePath: 'lib/images/coffee.png',
    ),
  ];

  // list of drinks in the users cart
  final List<Drink> _userCart = [];

  // get drinks for sale
  List<Drink> get shop => _shop;

  // get user cart
  List<Drink> get cart => _userCart;

  // add drink to cart
  void addToCart(Drink drink) {
    _userCart.add(drink);
    notifyListeners();
  }

  // remove drink from cart
  void removeFromCart(Drink drink) {
    _userCart.remove(drink);
    notifyListeners();
  }
}

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MyBottomNavBar extends StatelessWidget {
  void Function(int)? onTabChange;
  MyBottomNavBar({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: GNav(
        // -- FUNCTIONALITY -- //
        onTabChange: (value) => onTabChange!(value),

        // -- DECORATION -- //
        mainAxisAlignment:
            MainAxisAlignment.center, //place buttons in the centre
        color: Colors.grey[300], //colour for non-active icon
        activeColor: Colors.white, // colour for active icon
        tabActiveBorder: Border.all(color: Colors.white),
        gap: 8.0,
        tabs: const [
          // shop tab
          GButton(
            icon: Icons.home_outlined,
            text: 'Shop',
          ),
          // cart tab
          GButton(
            icon: Icons.shopping_bag_outlined,
            text: 'Cart',
          )
        ],
      ),
    );
  }
}

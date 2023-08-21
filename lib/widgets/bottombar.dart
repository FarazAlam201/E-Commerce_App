import 'package:e_commerce_app/screens/bagpage.dart';
import 'package:e_commerce_app/screens/favoritespage.dart';
import 'package:e_commerce_app/screens/homepage.dart';
import 'package:e_commerce_app/screens/profilepage.dart';
import 'package:e_commerce_app/screens/shoppage.dart';
import 'package:flutter/material.dart';

class ShowBottomBAr extends StatefulWidget {
  const ShowBottomBAr({super.key});

  @override
  State<ShowBottomBAr> createState() => _ShowBottomBArState();
}

class _ShowBottomBArState extends State<ShowBottomBAr> {
  int _selectedIconIndex = 0;
  var screenPages = [
    const Homepage(),
    const Shoppage(),
    const Bagpage(),
    const Favoritespage(),
    const Profilepage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.horizontal(
            left: Radius.circular(12), right: Radius.circular(12)),
        child: BottomNavigationBar(
          currentIndex: _selectedIconIndex,
          iconSize: 30,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart_outlined), label: 'Shop'),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_bag_outlined), label: 'Bag'),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border), label: 'Favorites'),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_outline), label: 'Profile')
          ],
          onTap: (index) {
            setState(() {
              _selectedIconIndex = index;
            });
          },
        ),
      ),
      body: screenPages[_selectedIconIndex],
    );
  }
}

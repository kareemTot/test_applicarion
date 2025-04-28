import 'dart:developer';

import 'package:flutter/material.dart';

import '../cart/views/cart_screen.dart';
import '../category/views/category_screen.dart';

class BottomNavBarScreen extends StatefulWidget {
  const BottomNavBarScreen({super.key});

  @override
  State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  int currentIndex = 0;

  final List<Widget> screens = [CategoryScreen(), CartScreen()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        selectedFontSize: 14,

        elevation: 0.0,
        onTap: (index) {
          setState(() {
            currentIndex = index;
            log("currentIndex: $currentIndex");
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category_outlined),
            label: "Categories",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            label: "Cart",
          ),
        ],
      ),
      body: screens[currentIndex],
    );
  }
}

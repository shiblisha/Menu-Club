import 'package:flutter/material.dart';
import 'package:menu_club/Ui/Bottom%20Navigater/category.dart';
import 'package:menu_club/Ui/Bottom%20Navigater/home.dart';
import 'package:menu_club/Ui/Bottom%20Navigater/oredes.dart';
import 'package:menu_club/Ui/Bottom%20Navigater/prodect.dart';

import 'Bottom Navigater/more.dart';
class bottom_navigation extends StatefulWidget {
  const bottom_navigation({Key? key}) : super(key: key);

  @override
  State<bottom_navigation> createState() => _bottom_navigationState();
}

final pages =[ HomePage(),CategoryPage(),OrderPage(),ProductPage(),MorePage()];
int activeIndex =0;
class _bottom_navigationState extends State<bottom_navigation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: 'Shop',
            icon: Icon(Icons.shop),
          ),
          BottomNavigationBarItem(
            label: 'Favorites',
            icon: Icon(Icons.favorite),
          ),
          BottomNavigationBarItem(
            label: 'Cart',
            icon: Icon(Icons.shopping_cart),
          ),
          BottomNavigationBarItem(
            label: 'Profile',
            icon: Icon(Icons.person),
          ),
        ],
        currentIndex: activeIndex,
        onTap: (index) {
          setState(() {
            activeIndex = index;
          });
        },
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.black,
        selectedLabelStyle: TextStyle(color: Colors.red),
        unselectedLabelStyle: TextStyle(color: Colors.black),
      ),
      body: pages[activeIndex],
    );
  }
}

import 'package:flutter/material.dart';


import 'package:menu_club/Ui/Bottom%20Navigater/home.dart';
import 'package:menu_club/Ui/Bottom%20Navigater/category.dart';
import 'package:menu_club/Ui/Bottom%20Navigater/prodect.dart';

import 'Bottom Navigater/more.dart';
import 'Bottom Navigater/Order/order.dart';
class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

final pages =[ HomePage(),OrderPage(),CategoryPage(),ProductPage(),MorePage()];
int activeIndex =0;
class _BottomNavigationState extends State<BottomNavigation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:BottomNavigationBar(
        selectedLabelStyle: TextStyle(color: Colors.red),
        unselectedLabelStyle: TextStyle(color: Colors.black),
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: 'Order',
            icon: Icon(Icons.text_snippet_sharp),
          ),
          BottomNavigationBarItem(
            label: 'Category',
            icon: Icon(Icons.category_outlined),
          ),
          BottomNavigationBarItem(
            label: 'Product',
            icon: Icon(Icons.food_bank_outlined),
          ),
          BottomNavigationBarItem(
            label: 'More',
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
      ),

      body: pages[activeIndex],
    );
  }
}

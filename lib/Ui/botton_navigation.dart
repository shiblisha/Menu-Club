import 'package:flutter/material.dart';

import 'Bottom Navigater/Categorys/category.dart';
import 'Bottom Navigater/Home/home.dart';
import 'Bottom Navigater/More/more.dart';
import 'Bottom Navigater/Order/order.dart';
import 'Bottom Navigater/Product/prodect.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}
int activeIndex = 0;
final pages = [
  HomePage(),
  OrderPage(),
  CategoryPage(),
  ProductPage(),
  MorePage()
];


class _BottomNavigationState extends State<BottomNavigation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedLabelStyle: TextStyle(color: Colors.red),
        unselectedLabelStyle: TextStyle(color: Colors.black),
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              label: "Home",
              icon: ImageIcon(AssetImage("assets/home.png"), size: 30)),
          BottomNavigationBarItem(
              label: 'Order',
              icon: ImageIcon(AssetImage("assets/order.png"), size: 30)),
          BottomNavigationBarItem(
              label: 'Category',
              icon: ImageIcon(AssetImage("assets/category.png"), size: 30)),
          BottomNavigationBarItem(
              label: 'Product',
              icon: ImageIcon(AssetImage("assets/product.png"), size: 30)),
          BottomNavigationBarItem(
              label: 'More',
              icon: ImageIcon(
                AssetImage("assets/shop.png"),
                size: 30,
              )),
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

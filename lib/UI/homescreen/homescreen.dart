import 'package:e_commerce/UI/account/AccountTab.dart';
import 'package:flutter/material.dart';

import '../category/CategoryTab.dart';
import '../wishlist/wishListTab.dart';
import 'BottomNavBar.dart';
import 'HomeTab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'homescreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              backgroundColor: Colors.transparent,
              icon: BottomNavIcon(
                iconName: 'ic_home',
                isSelected: selectedIndex == 0,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.transparent,
              icon: BottomNavIcon(
                iconName: 'ic_categories',
                isSelected: selectedIndex == 1,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.transparent,
              icon: BottomNavIcon(
                iconName: 'ic_favorites',
                isSelected: selectedIndex == 2,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.transparent,
              icon: BottomNavIcon(
                iconName: 'ic_account',
                isSelected: selectedIndex == 3,
              ),
              label: '',
            ),
          ],
        ),
      ),
      body: tabs[selectedIndex],
    );
  }

  var tabs = [HomeTab(), CategoryTab(), WishListTab(), AccountTab()];
}

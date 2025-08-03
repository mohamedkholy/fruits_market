import 'package:flutter/material.dart';
import 'package:fruits_market/core/theming/my_colors.dart';
import 'package:fruits_market/core/theming/my_text_styles.dart';
import 'package:fruits_market/features/home/ui/home_screen.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  final List<Widget> _pages = [
    const HomeScreen(),
    Container(color: Colors.red),
    Container(color: Colors.green),
    Container(color: Colors.blue),
    Container(color: Colors.purple),
  ];
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
        child: Container(
          height: 80,
          color: MyColors.primaryColor,
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
          child: GNav(
            mainAxisAlignment: MediaQuery.of(context).size.width < 600
                ? MainAxisAlignment.spaceBetween
                : MainAxisAlignment.spaceEvenly,
            tabBorderRadius: 35,
            duration: const Duration(milliseconds: 100),
            gap: 8,
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            textStyle: MyTextStyles.font24BoldPrimary.copyWith(fontSize: 15),
            color: MyColors.grey,
            activeColor: MyColors.primaryColor,
            tabBackgroundColor: Colors.white,
            selectedIndex: _currentIndex,
            onTabChange: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            tabs: [
              GButton(
                iconSize: _currentIndex == 0 ? 18 : 27,
                icon: const IconData(0xe817, fontFamily: "navigation"),
                text: 'Home',
              ),
              GButton(
                iconSize: _currentIndex == 1 ? 18 : 27,
                icon: const IconData(0xe810, fontFamily: "navigation"),
                text: 'Orders',
              ),
              GButton(
                iconSize: _currentIndex == 2 ? 22 : 32,
                icon: const IconData(0xe814, fontFamily: "navigation"),
                text: 'Cart',
              ),
              GButton(
                iconSize: _currentIndex == 3 ? 18 : 27,
                icon: const IconData(0xe812, fontFamily: "navigation"),
                text: 'Favorites',
              ),
              GButton(
                iconSize: _currentIndex == 4 ? 18 : 27,
                icon: const IconData(0xe811, fontFamily: "navigation"),
                text: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

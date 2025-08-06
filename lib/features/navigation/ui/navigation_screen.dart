import 'package:flutter/material.dart';
import 'package:fruits_market/features/basket/ui/basket_screen.dart';
import 'package:fruits_market/features/favorites/ui/favorites_screen.dart';
import 'package:fruits_market/features/home/ui/home_screen.dart';
import 'package:fruits_market/features/navigation/ui/widgets/bottom_nav_layout.dart';
import 'package:fruits_market/features/navigation/ui/widgets/navigation_rail_layout.dart';
import 'package:fruits_market/features/orders/ui/orders_screen.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  final List<Widget> _pages = [
    const HomeScreen(),
    OrdersScreen(),
    const BasketScreen(),
    const FavoritesScreen(),
    Container(color: Colors.purple),
  ];
  int _currentIndex = 0;

  final List<(IconData, String)> navItems = const [
    (IconData(0xe817, fontFamily: "navigation"), 'Home'),
    (IconData(0xe810, fontFamily: "navigation"), 'Orders'),
    (IconData(0xe814, fontFamily: "navigation"), 'Basket'),
    (IconData(0xe812, fontFamily: "navigation"), 'Favorites'),
    (IconData(0xe811, fontFamily: "navigation"), 'Profile'),
  ];

  @override
  Widget build(BuildContext context) {
    final isMediumWide = MediaQuery.sizeOf(context).width > 840;
    final isWide = MediaQuery.sizeOf(context).width > 1200;
    return Scaffold(
      body: Row(
        children: [
          if (isMediumWide)
            NavigationRailLayout(
              isWide: isWide,
              currentIndex: _currentIndex,
              onDestinationSelected: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              navItems: navItems,
            ),
          Expanded(child: _pages[_currentIndex]),
        ],
      ),
      bottomNavigationBar: isMediumWide
          ? null
          : BottomNavLayout(
              isWide: isWide,
              currentIndex: _currentIndex,
              onDestinationSelected: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              navItems: navItems,
            ),
    );
  }
}

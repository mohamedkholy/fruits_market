import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_market/features/basket/ui/basket_screen.dart';
import 'package:fruits_market/features/favorites/ui/favorites_screen.dart';
import 'package:fruits_market/features/home/ui/home_screen.dart';
import 'package:fruits_market/features/navigation/logic/navigation_cubit.dart';
import 'package:fruits_market/features/navigation/ui/widgets/bottom_nav_layout.dart';
import 'package:fruits_market/features/navigation/ui/widgets/navigation_rail_layout.dart';
import 'package:fruits_market/features/orders/ui/orders_screen.dart';
import 'package:fruits_market/features/profile/ui/profile_screen.dart';

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
    const ProfileScreen(),
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
    return BlocListener<NavigationCubit, int>(
      listener: (context, state) {
        setState(() {
          _currentIndex = state;
        });
      },
      child: Scaffold(
        extendBody: true,
        bottomNavigationBar: !isMediumWide
            ? BottomNavLayout(
                isWide: isWide,
                currentIndex: _currentIndex,
                onDestinationSelected: (index) {
                  context.read<NavigationCubit>().navigate(index);
                },
                navItems: navItems,
              )
            : null,
        body: Row(
          children: [
            if (isMediumWide)
              NavigationRailLayout(
                isWide: isWide,
                currentIndex: _currentIndex,
                onDestinationSelected: (index) {
                  context.read<NavigationCubit>().navigate(index);
                },
                navItems: navItems,
              ),
            Expanded(child: _pages[_currentIndex]),
          ],
        ),
      ),
    );
  }
}

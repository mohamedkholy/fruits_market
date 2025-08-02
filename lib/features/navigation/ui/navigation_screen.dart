import 'package:flutter/material.dart';
import 'package:fruits_market/core/theming/my_colors.dart';
import 'package:fruits_market/features/home/ui/home_screen.dart';

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
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: MyColors.primaryColor,
          selectedItemColor: Colors.white,
          unselectedItemColor: MyColors.grey,
          selectedFontSize: 1,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedIconTheme: const IconThemeData(size: 27),
          unselectedIconTheme: const IconThemeData(size: 25),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(IconData(0xe817, fontFamily: "navigation")),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(IconData(0xe810, fontFamily: "navigation")),
              label: 'Ranks',
            ),
            BottomNavigationBarItem(
              icon: Icon(IconData(0xe814, fontFamily: "navigation"), size: 32),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(IconData(0xe812, fontFamily: "navigation")),
              label: 'Favorites',
            ),
            BottomNavigationBarItem(
              icon: Icon(IconData(0xe811, fontFamily: "navigation")),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}

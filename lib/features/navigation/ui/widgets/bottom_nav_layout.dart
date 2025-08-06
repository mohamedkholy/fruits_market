import 'package:flutter/material.dart';
import 'package:fruits_market/core/theming/my_colors.dart';
import 'package:fruits_market/core/theming/my_text_styles.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavLayout extends StatelessWidget {
  final bool isWide;
  final int currentIndex;
  final Function(int) onDestinationSelected;
  final List<(IconData, String)> navItems;
  const BottomNavLayout({
    super.key,
    required this.isWide,
    required this.currentIndex,
    required this.onDestinationSelected,
    required this.navItems,
  });

  @override
  Widget build(BuildContext context) {
    final isNarrow = MediaQuery.sizeOf(context).width < 400;
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(25),
        topRight: Radius.circular(25),
      ),
      child: Container(
        height: 80,
        color: MyColors.primaryColor,
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
        child: GNav(
          mainAxisAlignment: MediaQuery.sizeOf(context).width < 600
              ? MainAxisAlignment.spaceBetween
              : MainAxisAlignment.spaceEvenly,
          tabBorderRadius: 35,
          duration: const Duration(milliseconds: 100),
          gap: 8,
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          textStyle: MyTextStyles.font24BoldPrimary.copyWith(fontSize: 15),
          color: Colors.grey.shade600,
          activeColor: MyColors.primaryColor,
          tabBackgroundColor: Colors.white,
          selectedIndex: currentIndex,

          onTabChange: onDestinationSelected,
          tabs: navItems.asMap().entries.map((entry) {
            final index = entry.key;
            final (iconData, label) = entry.value;

            return GButton(
              iconSize: switch (index) {
                2 => currentIndex == index ? 22 : 32, // Basket
                _ => currentIndex == index ? 18 : 27,
              },
              icon: iconData,
              text: isNarrow ? '' : label,
            );
          }).toList(),
        ),
      ),
    );
  }
}

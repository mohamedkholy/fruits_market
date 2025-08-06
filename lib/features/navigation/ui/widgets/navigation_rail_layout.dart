import 'package:flutter/material.dart';
import 'package:fruits_market/core/theming/my_colors.dart';
import 'package:fruits_market/core/theming/my_text_styles.dart';

class NavigationRailLayout extends StatelessWidget {
  final bool isWide;
  final int currentIndex;
  final Function(int) onDestinationSelected;
  final List<(IconData, String)> navItems;
  const NavigationRailLayout({
    super.key,
    required this.isWide,
    required this.currentIndex,
    required this.onDestinationSelected,
    required this.navItems,
  });

  @override
  Widget build(BuildContext context) {
    return NavigationRail(
      extended: isWide,
      indicatorColor: Colors.white,
      backgroundColor: MyColors.primaryColor,
      unselectedIconTheme: IconThemeData(color: Colors.grey.shade600),
      unselectedLabelTextStyle: MyTextStyles.font15RegularGrey.copyWith(
        color: Colors.grey.shade500,
      ),
      selectedLabelTextStyle: MyTextStyles.font15RegularGrey.copyWith(
        color: Colors.white,
      ),
      selectedIndex: currentIndex,
      onDestinationSelected: onDestinationSelected,
      labelType: isWide
          ? NavigationRailLabelType.none
          : NavigationRailLabelType.selected,
      destinations: navItems.asMap().entries.map((entry) {
        final index = entry.key;
        final (iconData, label) = entry.value;
        return NavigationRailDestination(
          icon: Icon(
            iconData,
            size: currentIndex == index
                ? (index == 2 ? 22 : 18)
                : (index == 2 ? 32 : 27),
          ),
          label: Text(label),
        );
      }).toList(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_market/core/routing/my_routes.dart';
import 'package:fruits_market/core/widgets/my_app_bar.dart';
import 'package:fruits_market/features/navigation/logic/navigation_cubit.dart';
import 'package:fruits_market/features/profile/ui/widgets/language_dialog.dart';
import 'package:fruits_market/features/profile/ui/widgets/profile_options_item.dart';
import 'package:fruits_market/features/profile/ui/widgets/user_profile_picture.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isSigned = false;
  final Map<String, IconData> profileOptions = const {
    "Profile": Icons.person_outline,
    "My Orders": Icons.shopping_cart_outlined,
    "Favorites": Icons.favorite_outline,
    "Language": Icons.language,
    "Contact us": Icons.support_agent,
    "Terms & Conditions": Icons.description_outlined,
    "About Us": Icons.info_outline,
    "Logout": Icons.logout_outlined,
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(title: "Profile"),
      body: SafeArea(
        bottom: false,
        child: Align(
          alignment: Alignment.topCenter,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 32,
                ),
                child: Column(
                  children: [
                    const UserProfilePicture(),
                    const SizedBox(height: 32),
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: profileOptions.length,
                      itemBuilder: (context, index) {
                        return ProfileOptionsItem(
                          icon: profileOptions.values.elementAt(index),
                          text: profileOptions.keys.elementAt(index),
                          onTap: () {
                            switch (profileOptions.keys.elementAt(index)) {
                              case "Profile":
                                Navigator.pushNamed(
                                  context,
                                  MyRoutes.updateProfileScreen,
                                );
                                break;
                              case "My Orders":
                                context.read<NavigationCubit>().navigate(1);
                                break;
                              case "Favorites":
                                context.read<NavigationCubit>().navigate(3);
                                break;
                              case "Language":
                                showDialog(
                                  context: context,
                                  builder: (context) => const LanguageDialog(),
                                );
                                break;
                              case "Contact us":
                                Navigator.pushNamed(
                                  context,
                                  MyRoutes.contactUsScreen,
                                );
                                break;
                              case "Terms & Conditions":
                                Navigator.pushNamed(
                                  context,
                                  MyRoutes.termsConditionsScreen,
                                );
                                break;
                              case "About Us":
                                break;
                              case "Logout":
                                break;
                            }
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

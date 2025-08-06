import 'package:flutter/material.dart';
import 'package:fruits_market/core/theming/my_text_styles.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key, required this.title, this.onBackPressed, this.actions});
  final String title;
  final VoidCallback? onBackPressed;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title, style: MyTextStyles.font24BoldPrimary),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1),
        child: Container(color: Colors.grey[300], height: 1.0),
      ),
      centerTitle: true,
      automaticallyImplyLeading: false,
      leading: ModalRoute.of(context)?.canPop ?? false
          ? IconButton(
              onPressed: onBackPressed ?? () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios),
            )
          : null,
          actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}

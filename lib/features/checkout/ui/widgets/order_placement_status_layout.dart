import 'package:flutter/material.dart';
import 'package:fruits_market/assets/assets.dart';
import 'package:fruits_market/core/theming/my_colors.dart';
import 'package:fruits_market/core/theming/my_text_styles.dart';
import 'package:fruits_market/core/widgets/my_button.dart';
import 'package:fruits_market/features/checkout/ui/widgets/failure_layout.dart';
import 'package:fruits_market/features/checkout/ui/widgets/success_layout.dart';

class OrderPlacementStatusLayout extends StatelessWidget {
  const OrderPlacementStatusLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Checkout", style: MyTextStyles.font24BoldPrimary),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(color: Colors.grey[300], height: 1.0),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: const SizedBox(
              width: double.infinity,
              child: SuccessLayout(),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:fruits_market/core/widgets/my_app_bar.dart';
import 'package:fruits_market/features/checkout/ui/widgets/failure_layout.dart';

class OrderPlacementStatusLayout extends StatelessWidget {
  const OrderPlacementStatusLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(title: "Checkout"),
      body: SingleChildScrollView(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: const SizedBox(
              width: double.infinity,
              child: FailureLayout(),
            ),
          ),
        ),
      ),
    );
  }
}

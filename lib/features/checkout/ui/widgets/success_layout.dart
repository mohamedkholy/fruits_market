import 'package:flutter/material.dart';
import 'package:fruits_market/assets/assets.dart';
import 'package:fruits_market/core/models/order.dart';
import 'package:fruits_market/core/models/order_status.dart';
import 'package:fruits_market/core/models/payment_method.dart';
import 'package:fruits_market/core/routing/my_routes.dart';
import 'package:fruits_market/core/theming/my_colors.dart';
import 'package:fruits_market/core/theming/my_text_styles.dart';
import 'package:fruits_market/core/widgets/my_button.dart';

class SuccessLayout extends StatelessWidget {
  SuccessLayout({super.key});
  Order order = Order(
    id: "#243188",
    totalAmount: 37.0,
    date: DateTime(2025, 9, 9),
    itemCount: 4,
    status: OrderStatus.delivering,
    paymentMethod: PaymentMethod.credit,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        FractionallySizedBox(
          widthFactor: .8,
          child: Image.asset(Assets.imagesPngPayConfirm),
        ),
        const SizedBox(height: 20),
        const Text(
          "YOUR ORDER IS CONFIRMED!",
          textAlign: TextAlign.center,
          style: MyTextStyles.font24BoldPrimary,
        ),
        const SizedBox(height: 20),
        Text(
          "Your order code: ${order.id}",
          textAlign: TextAlign.center,
          style: MyTextStyles.font16MediumGrey,
        ),
        const Text(
          "Thank you for choosing our products!",
          textAlign: TextAlign.center,
          style: MyTextStyles.font16MediumGrey,
        ),
        const SizedBox(height: 32),
        FractionallySizedBox(
          widthFactor: .8,
          child: MyButton(
            onPressed: () {
              Navigator.pop(context);
            },
            text: "Continue Shopping",
          ),
        ),
        const SizedBox(height: 20),
        FractionallySizedBox(
          widthFactor: .8,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: MyColors.primaryColor,
              minimumSize: const Size.fromHeight(50),
              textStyle: MyTextStyles.font16BoldBlack,
              backgroundColor: Colors.white,
              side: const BorderSide(color: MyColors.primaryColor),
            ),
            onPressed: () {
              Navigator.pushReplacementNamed(
                context,
                MyRoutes.orderTrackingScreen,
                arguments: order,
              );
            },
            child: const Text("Track Order"),
          ),
        ),
        const SizedBox(height: 70),
      ],
    );
  }
}

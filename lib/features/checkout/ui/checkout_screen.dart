import 'package:flutter/material.dart';
import 'package:fruits_market/core/routing/my_routes.dart';
import 'package:fruits_market/core/theming/my_text_styles.dart';
import 'package:fruits_market/core/widgets/my_button.dart';
import 'package:fruits_market/features/checkout/ui/widgets/checkout_progress.dart';
import 'package:fruits_market/features/checkout/ui/widgets/delivery_address_layout.dart';
import 'package:fruits_market/features/checkout/ui/widgets/delivery_time_layout.dart';
import 'package:fruits_market/features/checkout/ui/widgets/payment_layout.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  int step = 0;
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: step == 0,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop) {
          if (step > 0) {
            setState(() {
              step--;
            });
          }
        }
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
            onPressed: () {
              if (step == 0) {
                Navigator.pop(context);
              } else {
                setState(() {
                  step--;
                });
              }
            },
            icon: const Icon(Icons.arrow_back_ios_new),
          ),
          title: const Text("Checkout", style: MyTextStyles.font24BoldPrimary),
          centerTitle: true,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(1),
            child: Container(color: Colors.grey[300], height: 1.0),
          ),
        ),
        body: SafeArea(
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 600),
              child: Container(
                margin: EdgeInsets.only(
                  top: 30,
                  bottom: MediaQuery.sizeOf(context).height < 500 ? 15 : 30,
                ),
                child: Column(
                  children: [
                    CheckoutProgress(step: step + 1),
                    const SizedBox(height: 20),
                    Expanded(
                      child: IndexedStack(
                        index: step,
                        children: const [
                          DeliveryTimeLayout(),
                          DeliveryAddressLayout(),
                          PaymentLayout(),
                        ],
                      ),
                    ),
                    Center(
                      child: FractionallySizedBox(
                        widthFactor: 0.8,
                        child: MyButton(
                          onPressed: () {
                            if (step > 1) {
                              Navigator.pushReplacementNamed(
                                context,
                                MyRoutes.orderPlacementScreen,
                              );
                            } else {
                              setState(() {
                                step++;
                              });
                            }
                          },
                          text: step > 1 ? "Place Order" : "Continue",
                        ),
                      ),
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

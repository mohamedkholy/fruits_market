import 'package:flutter/material.dart';
import 'package:fruits_market/core/models/order.dart';
import 'package:fruits_market/core/widgets/my_app_bar.dart';
import 'package:fruits_market/core/widgets/my_button.dart';
import 'package:fruits_market/features/order_tracking/ui/widgets/cancle_order_dialog.dart';
import 'package:fruits_market/features/order_tracking/ui/widgets/order_status_timeline_layout.dart';
import 'package:fruits_market/features/order_tracking/ui/widgets/tracked_order_details_column.dart';

class OrderTrackingScreen extends StatelessWidget {
  final Order order;
  const OrderTrackingScreen({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(title: "Order Tracking"),
      body: SafeArea(
        child: Align(
          alignment: Alignment.topCenter,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1200),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.only(bottom: 15, left: 28, right: 28),
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const SizedBox(height: 10),
                          TrackedOrderDetailsColumn(order: order),
                          const SizedBox(height: 20),
                          OrderStatusTimelineLayout(order: order),
                        ],
                      ),
                    ),
                  ),
                  AnimatedFractionallySizedBox(
                    duration: const Duration(milliseconds: 1000),
                    widthFactor: MediaQuery.sizeOf(context).width < 850
                        ? .9
                        : .5,
                    child: MyButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => const CancleOrderDialog(),
                        );
                      },
                      text: "Cancel Order",
                      color: Colors.red,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height < 500 ? 0 : 20,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

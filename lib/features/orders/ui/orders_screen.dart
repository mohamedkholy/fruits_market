import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:fruits_market/core/models/order.dart';
import 'package:fruits_market/core/models/order_status.dart';
import 'package:fruits_market/core/theming/my_text_styles.dart';
import 'package:fruits_market/features/orders/ui/widgets/order_item_layout.dart';

class OrdersScreen extends StatelessWidget {
  OrdersScreen({super.key});

  final List<Order> orders = [
    Order(
      orderId: "#243188",
      totalPrice: 37.0,
      orderDate: DateTime(2025, 9, 9),
      itemCount: 4,
      status: OrderStatus.delivering,
    ),
    Order(
      orderId: "#243189",
      totalPrice: 42.5,
      orderDate: DateTime(2025, 9, 10),
      itemCount: 3,
      status: OrderStatus.finished,
    ),
    Order(
      orderId: "#243190",
      totalPrice: 25.0,
      orderDate: DateTime(2025, 9, 11),
      itemCount: 2,
      status: OrderStatus.canceled,
    ),
    Order(
      orderId: "#243191",
      totalPrice: 60.0,
      orderDate: DateTime(2025, 9, 12),
      itemCount: 5,
      status: OrderStatus.working,
    ),
    Order(
      orderId: "#243192",
      totalPrice: 90.0,
      orderDate: DateTime(2025, 9, 13),
      itemCount: 6,
      status: OrderStatus.delivered,
    ),
    Order(
      orderId: "#243193",
      totalPrice: 15.0,
      orderDate: DateTime(2025, 9, 14),
      itemCount: 1,
      status: OrderStatus.newOrder,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Orders", style: MyTextStyles.font24BoldPrimary),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(color: Colors.grey[300], height: 1.0),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1200),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: DynamicHeightGridView(
                crossAxisCount: MediaQuery.of(context).size.width < 650 ? 1 : 2,
                itemCount: orders.length,
                builder: (context, index) {
                  return OrderItemLayout(order: orders[index]);
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

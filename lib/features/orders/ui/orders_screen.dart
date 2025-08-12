import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:fruits_market/core/models/order.dart';
import 'package:fruits_market/core/models/order_status.dart';
import 'package:fruits_market/core/models/payment_method.dart';
import 'package:fruits_market/core/widgets/my_app_bar.dart';
import 'package:fruits_market/features/orders/ui/widgets/order_item_layout.dart';

class OrdersScreen extends StatelessWidget {
  OrdersScreen({super.key});

  final List<Order> orders = [
    Order(
      id: "#243188",
      totalAmount: 37.0,
      date: DateTime(2025, 9, 9),
      itemCount: 4,
      status: OrderStatus.delivering,
      paymentMethod: PaymentMethod.credit,
    ),
    Order(
      id: "#243189",
      totalAmount: 42.5,
      date: DateTime(2025, 9, 10),
      itemCount: 3,
      status: OrderStatus.shipped,
      paymentMethod: PaymentMethod.knet,
    ),
    Order(
      id: "#243190",
      totalAmount: 25.0,
      date: DateTime(2025, 9, 11),
      itemCount: 2,
      status: OrderStatus.confirmed,
      paymentMethod: PaymentMethod.onDelivery,
    ),
    Order(
      id: "#243191",
      totalAmount: 60.0,
      date: DateTime(2025, 9, 12),
      itemCount: 5,
      status: OrderStatus.shipped,
      paymentMethod: PaymentMethod.credit,
    ),
    Order(
      id: "#243192",
      totalAmount: 90.0,
      date: DateTime(2025, 9, 13),
      itemCount: 6,
      status: OrderStatus.delivered,
      paymentMethod: PaymentMethod.onDelivery,
    ),
    Order(
      id: "#243193",
      totalAmount: 15.0,
      date: DateTime(2025, 9, 14),
      itemCount: 1,
      status: OrderStatus.placed,
      paymentMethod: PaymentMethod.knet,
    ),
    Order(
      id: "#243188",
      totalAmount: 37.0,
      date: DateTime(2025, 9, 9),
      itemCount: 4,
      status: OrderStatus.delivering,
      paymentMethod: PaymentMethod.credit,
    ),
    Order(
      id: "#243189",
      totalAmount: 42.5,
      date: DateTime(2025, 9, 10),
      itemCount: 3,
      status: OrderStatus.shipped,
      paymentMethod: PaymentMethod.knet,
    ),
    Order(
      id: "#243190",
      totalAmount: 25.0,
      date: DateTime(2025, 9, 11),
      itemCount: 2,
      status: OrderStatus.confirmed,
      paymentMethod: PaymentMethod.onDelivery,
    ),
    Order(
      id: "#243191",
      totalAmount: 60.0,
      date: DateTime(2025, 9, 12),
      itemCount: 5,
      status: OrderStatus.shipped,
      paymentMethod: PaymentMethod.credit,
    ),
    Order(
      id: "#243192",
      totalAmount: 90.0,
      date: DateTime(2025, 9, 13),
      itemCount: 6,
      status: OrderStatus.delivered,
      paymentMethod: PaymentMethod.onDelivery,
    ),
    Order(
      id: "#243193",
      totalAmount: 15.0,
      date: DateTime(2025, 9, 14),
      itemCount: 1,
      status: OrderStatus.placed,
      paymentMethod: PaymentMethod.knet,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(title: "Orders"),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return DynamicHeightGridView(
                crossAxisCount: constraints.maxWidth < 700 ? 1 : 2,
                itemCount: orders.length,
                builder: (context, index) {
                  return Container(
                    margin: index == 0
                        ? const EdgeInsets.only(top: 10)
                        : index == orders.length - 1
                        ? const EdgeInsets.only(bottom: 10)
                        : null,
                    child: OrderItemLayout(order: orders[index]),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
